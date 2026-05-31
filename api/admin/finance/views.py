from api.mixins import FilterByUserQsMixin
from rest_framework import viewsets
from rest_framework.generics import UpdateAPIView
from rest_framework.response import Response
from api.common.finance.serializers import (
    FinancialRequestDetailSerializer,
    TransactionCreateSerializer,
    PaymentAccountSerializer
)
from api.permission import IsAdmin
from finance.models import FinancialRequest, PaymentAccount
from finance.constants import (
    FINANCIAL_STATUS_APPROVED,
    FINANCIAL_STATUS_DECLINED,
    FINANCIAL_TYPE_SND_INVOICE,
    FINANCIAL_STATUS_PENDING,
    FINANCIAL_TYPE_RCV_PAYMENT
)


class ApproveFinanicalRequestView(FilterByUserQsMixin, UpdateAPIView):
    serializer_class = FinancialRequestDetailSerializer
    permission_classes = [IsAdmin]
    queryset = FinancialRequest.objects.all()

    def update(self, request, pk):
        financial_request = FinancialRequest.objects.get(id=pk)
        if financial_request.type != FINANCIAL_TYPE_SND_INVOICE:
            transaction_data = request.data
            transaction_data['financial_request'] = pk
            transaction_data['owner'] = financial_request.requester.id
            if financial_request.project is not None:
                transaction_data['project'] = financial_request.project.id
            transaction_data['address'] = financial_request.address
            transaction_data['description'] = financial_request.description
            transaction_ser = TransactionCreateSerializer(data=transaction_data)
            transaction_ser.is_valid(raise_exception=True)
            transaction_ser.save()
        instance = self.get_object()
        instance.status = FINANCIAL_STATUS_APPROVED
        serializer = self.get_serializer(instance)
        instance.save()
        
        if financial_request.type == FINANCIAL_TYPE_SND_INVOICE:
            instance.pk = None
            instance.status = FINANCIAL_STATUS_PENDING
            instance.type = FINANCIAL_TYPE_RCV_PAYMENT
            instance.save()

        return Response(serializer.data)


class DeclineFinanicalRequestView(FilterByUserQsMixin, UpdateAPIView):
    serializer_class = FinancialRequestDetailSerializer
    permission_classes = [IsAdmin]
    queryset = FinancialRequest.objects.all()

    def update(self, request, pk):
        instance = self.get_object()
        instance.status = FINANCIAL_STATUS_DECLINED
        serializer = self.get_serializer(instance)
        instance.save()
        return Response(serializer.data)


class PaymentAccountViewSet(viewsets.ModelViewSet):
    serializer_class = PaymentAccountSerializer
    permission_classes = [IsAdmin]
    queryset = PaymentAccount.objects.all()

    def get_queryset(self):
        if self.request.user.is_anonymous:
            return PaymentAccount.objects.none()
        elif self.request.user.is_admin:
            payment_accounts = PaymentAccount.objects.all()
            archived = self.request.query_params.get('archived')
            if archived is not None:
                return payment_accounts.filter(archived=True)
            return payment_accounts.filter(archived=False)

from rest_framework.generics import UpdateAPIView
from rest_framework.response import Response
from api.common.finance.serializers import FinancialRequestDetailSerializer, FinancialRequestSerializer
from finance.models import FinancialRequest
from finance.constants import FINANCIAL_STATUS_CANCELED
from ...permission import IsDeveloper

class CancelFinanicalRequestView(UpdateAPIView):
    serializer_class = FinancialRequestDetailSerializer
    queryset = FinancialRequest.objects.all()
    permission_classes = [IsDeveloper]
    
    def update(self, request, pk):
        instance = self.get_object()
        instance.status = FINANCIAL_STATUS_CANCELED
        serializer = self.get_serializer(instance)
        instance.save()
        return Response(serializer.data)

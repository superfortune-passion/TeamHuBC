from api.mixins import FilterByUserQsMixin, SoftDeleteMixin
from rest_framework import viewsets
from rest_framework.generics import UpdateAPIView, ListAPIView
from rest_framework import mixins
from rest_framework.response import Response
from rest_framework import status
from rest_framework import filters
from rest_framework.filters import SearchFilter
from rest_framework.permissions import IsAuthenticated
from django_filters.rest_framework import DjangoFilterBackend

from ...permission import IsDeveloper, IsTeamManager, IsTeamManagerOrDeveloper
from api.common.finance.serializers import (
    ClientDetailSerializer,
    ClientUpdateSerializer,
    PartnerSerializer,
    PartnerDetailSerializer,
    ProjectSerializer,
    ProjectListSerializer,
    FinancialRequestDetailSerializer,
    FinancialRequestSerializer,
    PaymentAccountSerializer
)
from finance.models import (
    Client, 
    Partner,
    Project,
    FinancialRequest,
    PaymentAccount
)
from .filters import (
    ProjectFilter,
    FinancialRequestFilter,
)
from user import constants as ucs


class ClientViewSet(FilterByUserQsMixin, viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated]
    queryset = Client.objects.all().order_by('-full_name')
    filter_backends = [SearchFilter, filters.OrderingFilter, DjangoFilterBackend ]
    search_fields=['type', 'full_name', 'company_name', 'started_at', 'owner__first_name', 'owner__last_name']
    ordering_fields=['type', 'full_name', 'company_name', 'started_at', 'owner']

    def get_serializer_class(self):
        if self.request.method in ['PUT', 'POST', 'PATCH']:
            return ClientUpdateSerializer
        return ClientDetailSerializer


class PartnerViewSet(FilterByUserQsMixin, SoftDeleteMixin, viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated]
    queryset = Partner.objects.all()
    all_queryset = Partner.all_objects.all()

    def get_serializer_class(self):
        if self.request.method in ['PUT', 'POST', 'PATCH']:
            return PartnerSerializer
        return PartnerDetailSerializer


class ProjectViewSet(FilterByUserQsMixin, viewsets.ModelViewSet):
    serializer_class = ProjectSerializer
    permission_classes = [IsAuthenticated]
    queryset = Project.objects.all()
    filter_backends = [SearchFilter, filters.OrderingFilter, DjangoFilterBackend ]
    search_fields=['type', 'title', 'weekly_limit', 'price', 'status', 'project_starter__first_name', 'project_starter__last_name']
    ordering_fields=['title', 'type', 'weekly_limit', 'price', 'status', 'project_starter']
    filterset_class = ProjectFilter

    def get_serializer_class(self):
        if self.request.method == 'GET' and self.action == 'list':
            return ProjectListSerializer
        else:
            return ProjectSerializer


class FinancialRequestViewSet(  FilterByUserQsMixin,
                                mixins.CreateModelMixin,
                                mixins.ListModelMixin,
                                mixins.RetrieveModelMixin,
                                viewsets.GenericViewSet):
    permission_classes = [IsAuthenticated]
    queryset = FinancialRequest.objects.all().order_by('-requested_at')
    filterset_class = FinancialRequestFilter
    filter_backends = [SearchFilter, filters.OrderingFilter, DjangoFilterBackend]
    search_fields = ['requester__first_name', 'requester__last_name', 'project__title' , 'address', 'amount', 'payment_account__display_name']
    ordering_fields = ['requested_at', 'project', 'requester', 'address', 'amount', 'payment_account', 'status', 'type']

    def get_serializer_class(self):
        if self.request.method == 'GET':
            return FinancialRequestDetailSerializer
        elif self.request.method in ['POST', 'PUT']:
            return FinancialRequestSerializer

    def create(self, request):
        serializer_data = request.data
        if request.user.role != ucs.ROLE_ADMIN:
            serializer_data['requester'] = request.user.id
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        serializer = FinancialRequestDetailSerializer(instance=serializer.instance)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

    def update(self, request, *args, **kwargs):
        instance = self.get_object()
        kwargs['partial'] = True
        partial = kwargs.pop('partial', False)
        serializer = self.get_serializer(instance, data=request.data, partial=partial, context={'request': request})
        serializer.is_valid(raise_exception=True)
        updated = serializer.update(instance, serializer.validated_data)
        formated = FinancialRequestDetailSerializer(updated)
        return Response(formated.data)


class PaymentAccountView(ListAPIView):
    serializer_class = PaymentAccountSerializer
    permission_classes = [IsTeamManagerOrDeveloper]
    queryset = PaymentAccount.objects.filter(archived=False)

from rest_framework.generics import ListAPIView, RetrieveAPIView
from django_filters.rest_framework import DjangoFilterBackend

from api.permission import IsDeveloper
from finance.models import Project, Transaction
from api.utils.download import get_download_response
from api.utils.provider import (
    get_queryset_with_project_earnings,
    get_report_project_data_frame,
    get_transaction_data_frame
)
from api.developer.transaction.filters import TransactionFilter


class ReportDeveloperProjectDownloadView(ListAPIView):
    permission_classes = [IsDeveloper]
    pagination_class = None
    queryset = Project.objects.all()

    def get_queryset(self):
        return get_queryset_with_project_earnings(
            self.queryset.filter(financialrequest__requester=self.request.user),
            self.request.query_params
        )

    def get(self, request, *args, **kwargs):
        query_set = self.get_queryset()
        df = get_report_project_data_frame(query_set)
        return get_download_response(df, 'my_project_list.csv')


class TransactionDownloadView(ListAPIView):
    permission_classes = [IsDeveloper]
    filter_backends = (DjangoFilterBackend,)
    filterset_class = TransactionFilter
    pagination_class = None
    queryset = Transaction.objects.all()

    def get_queryset(self):
        user = self.request.user
        return self.queryset \
        .filter_by_period(self.request.query_params) \
        .filter(financial_request__requester=user) \
        .order_by('-created_at')

    def get(self, request):
        query_set = self.filter_queryset(self.get_queryset())
        df = get_transaction_data_frame(query_set)

        return get_download_response(df, 'transactions.csv')

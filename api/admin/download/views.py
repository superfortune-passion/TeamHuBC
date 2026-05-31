from rest_framework.generics import ListAPIView, RetrieveAPIView
from django_filters.rest_framework import DjangoFilterBackend

from api.permission import IsAdmin
from user.models import User, Team
from finance.models import Project, Transaction
from api.common.report.filters import DeveloperReportFilter, TeamReportFilter
from api.admin.transaction.filters import TransactionFilter
from api.utils.download import get_download_response
from api.utils.provider import (
    get_queryset_with_developer_earnings,
    get_queryset_with_project_earnings,
    get_queryset_with_team_earnings,
    get_report_developer_data_frame,
    get_report_project_data_frame,
    get_report_team_data_frame,
    get_transaction_data_frame
)


class ReportDeveloperListDownloadView(ListAPIView):
    permission_classes = [IsAdmin]
    filter_backends = (DjangoFilterBackend,)
    filterset_class = DeveloperReportFilter
    pagination_class = None
    queryset = User.objects.all()
    
    def get_queryset(self):
        return get_queryset_with_developer_earnings(
            self.queryset,
            self.request.query_params)

    def get(self, request):
       query_set = self.filter_queryset(self.get_queryset())
       df = get_report_developer_data_frame(query_set)
       return get_download_response(df, 'developer_list.csv')


class ReportDeveloperDetailDownloadView(RetrieveAPIView):
    permission_classes = [IsAdmin]
    model = User

    def get_queryset(self):
        return get_queryset_with_developer_earnings(
            User.objects.filter(id=self.kwargs.get('pk')),
            self.request.query_params)

    def get(self, request, *args, **kwargs):
        user = self.get_object()
        df = get_report_developer_data_frame([user])

        return get_download_response(df, 'developer_detail.csv')


class ReportDeveloperProjectDownloadView(ListAPIView):
    permission_classes = [IsAdmin]
    pagination_class = None
    queryset = Project.objects.all()

    def get_queryset(self):
        return get_queryset_with_project_earnings(
            self.queryset.filter(financialrequest__requester=self.kwargs.get('pk')),
            self.request.query_params
        )

    def get(self, request, *args, **kwargs):
        query_set = self.get_queryset()
        df = get_report_project_data_frame(query_set)
        return get_download_response(df, 'developer_project_list.csv')


class ReportTeamListDownloadView(ListAPIView):
    permission_classes = [IsAdmin]
    pagination_class = None
    filter_backends = (DjangoFilterBackend,)
    filterset_class = TeamReportFilter
    queryset = Team.objects.all()

    def get_queryset(self):
        return get_queryset_with_team_earnings(
            self.queryset,
            self.request.query_params)

    def get(self, request):
       query_set = self.filter_queryset(self.get_queryset())
       df = get_report_team_data_frame(query_set)
       return get_download_response(df, 'team_list.csv')


class ReportTeamDetailDownloadView(RetrieveAPIView):
    permission_classes = [IsAdmin]
    model = Team
    serializer_class = None

    def get_queryset(self):
        return get_queryset_with_team_earnings(
            Team.objects.filter(id=self.kwargs.get('pk')),
            self.request.query_params)

    def get(self, request, *args, **kwargs):
        team = self.get_object()
        df = get_report_team_data_frame([team])

        return get_download_response(df, 'team_detail.csv')


class TransactionDownloadView(ListAPIView):
    permission_classes = [IsAdmin]
    filter_backends = (DjangoFilterBackend,)
    filterset_class = TransactionFilter
    pagination_class = None
    queryset = Transaction.objects.all()

    def get_queryset(self):
        return self.queryset \
        .filter_by_period(self.request.query_params) \
        .order_by('-created_at')

    def get(self, request):
        query_set = self.filter_queryset(self.get_queryset())
        df = get_transaction_data_frame(query_set)

        return get_download_response(df, 'transactions.csv')

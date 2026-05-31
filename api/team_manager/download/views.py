from rest_framework.generics import ListAPIView, RetrieveAPIView
from django_filters.rest_framework import DjangoFilterBackend

from api.permission import IsTeamManager
from user.models import User
from finance.models import Project, Transaction
from api.common.report.filters import DeveloperReportFilter, TeamReportFilter
from api.utils.download import get_download_response
from api.utils.provider import (
    get_queryset_with_developer_earnings,
    get_queryset_with_project_earnings,
    get_report_developer_data_frame,
    get_report_project_data_frame,
    get_transaction_data_frame
)
from api.team_manager.transaction.filters import TransactionFilter

class ReportDeveloperListDownloadView(ListAPIView):
    permission_classes = [IsTeamManager]
    filter_backends = (DjangoFilterBackend,)
    filterset_class = DeveloperReportFilter
    pagination_class = None
    queryset = User.objects.all()
    
    def get_queryset(self):
        members = self.queryset.filter(team=self.request.user.team)
        return get_queryset_with_developer_earnings(
            members,
            self.request.query_params)

    def get(self, request):
       query_set = self.filter_queryset(self.get_queryset())
       df = get_report_developer_data_frame(query_set)
       return get_download_response(df, 'my_team_developer_list.csv')


class ReportDeveloperDetailDownloadView(RetrieveAPIView):
    permission_classes = [IsTeamManager]
    model = User

    def get_queryset(self):
        member_set = User.objects.filter(team=self.request.user.team)
        return get_queryset_with_developer_earnings(
            member_set.filter(id=self.kwargs.get('pk')),
            self.request.query_params)

    def get(self, request, *args, **kwargs):
        user = self.get_object()
        df = get_report_developer_data_frame([user])

        return get_download_response(df, 'my_team_developer_detail.csv')


class ReportDeveloperProjectDownloadView(ListAPIView):
    permission_classes = [IsTeamManager]
    pagination_class = None
    queryset = Project.objects.all()

    def get_queryset(self):
        project_set = self.queryset.filter(financialrequest__requester__team=self.request.user.team)
        return get_queryset_with_project_earnings(
            project_set.filter(financialrequest__requester=self.kwargs.get('pk')),
            self.request.query_params
        )

    def get(self, request, *args, **kwargs):
        query_set = self.get_queryset()
        df = get_report_project_data_frame(query_set)
        return get_download_response(df, 'my_team_developer_project_list.csv')


class TransactionDownloadView(ListAPIView):
    permission_classes = [IsTeamManager]
    filter_backends = (DjangoFilterBackend,)
    filterset_class = TransactionFilter
    pagination_class = None
    queryset = Transaction.objects.all()

    def get_queryset(self):
        user = self.request.user
        return self.queryset\
        .filter_by_period(self.request.query_params) \
        .filter(financial_request__requester__in=user.team_members) \
        .order_by('-created_at')
        
    def get(self, request):
        query_set = self.filter_queryset(self.get_queryset())
        df = get_transaction_data_frame(query_set)

        return get_download_response(df, 'transactions.csv')

        
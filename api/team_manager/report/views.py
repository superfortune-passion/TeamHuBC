import numpy as np
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.generics import ListAPIView, GenericAPIView, RetrieveAPIView
from django_filters.rest_framework import DjangoFilterBackend
from api.permission import IsTeamManager
from api.utils.provider import (
    get_earnings,
    get_queryset_with_developer_earnings,
    get_queryset_with_project_earnings
)
from user.models import User, Team
from finance.models import Project
from api.common.report.serializers import (
    ReportDeveloperSerializer,
    ReportProjectEarningsSerializer
)
from api.common.report.filters import DeveloperReportFilter, DeveloperReportFilter
from api.common.report import constants


class ReportTotalView(GenericAPIView):
    permission_classes = [IsTeamManager]
    filter_backends = (DjangoFilterBackend,)
    filterset_class = DeveloperReportFilter

    def get(self, obj):
        period = self.request.query_params.get('period')
        start_date = self.request.query_params.get('from')
        end_date = self.request.query_params.get('to')
        viewer = self.request.user
        res =  {'total_earnings': get_earnings(viewer, period=period, start_date=start_date, end_date=end_date)}
        return Response(res)


class ReportDeveloperListView(ListAPIView):
    permission_classes = [IsTeamManager]
    serializer_class = ReportDeveloperSerializer

    def get_queryset(self):
        return get_queryset_with_developer_earnings(
            User.objects.filter(team=self.request.user.team),
            self.request.query_params
        )


class ReportDeveloperDetailView(RetrieveAPIView):
    permission_classes = [IsTeamManager]
    serializer_class = ReportDeveloperSerializer

    def get_queryset(self):
        return get_queryset_with_developer_earnings(
            User.objects.filter(id=self.kwargs.get('pk')),
            self.request.query_params
        )
    


class ReportProjectEarningsListView(ListAPIView):
    permission_classes = [IsTeamManager]
    serializer_class = ReportProjectEarningsSerializer
    pagination_class = None
    
    def get_queryset(self):
        return get_queryset_with_project_earnings(
            Project.objects.filter(financialrequest__requester=self.kwargs.get('pk')),
            self.request.query_params
        )

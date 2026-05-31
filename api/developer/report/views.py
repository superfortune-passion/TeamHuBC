import numpy as np
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.generics import ListAPIView
from django_filters.rest_framework import DjangoFilterBackend
from api.permission import IsDeveloper
from user.models import User, Team
from finance.models import Project
from api.common.report.serializers import (
    ReportProjectEarningsSerializer,
    ReportDeveloperEarningSerializer
)
from api.common.report.filters import DeveloperReportFilter
from api.common.report import constants
from api.utils.provider import (
    get_queryset_with_developer_earnings,
    get_queryset_with_project_earnings
)


class ReportDeveloperView(ListAPIView):
    permission_classes = [IsDeveloper]
    serializer_class = ReportDeveloperEarningSerializer
    pagination_class = None

    def get_queryset(self):
        return get_queryset_with_developer_earnings(
            User.objects.filter(id=self.request.user.id),
            self.request.query_params
        )


class ReportProjectEarningsListView(ListAPIView):
    permission_classes = [IsDeveloper]
    serializer_class = ReportProjectEarningsSerializer
    pagination_class = None
    
    def get_queryset(self):
        return get_queryset_with_project_earnings(
            Project.objects.filter(financialrequest__requester=self.request.user),
            self.request.query_params
        )

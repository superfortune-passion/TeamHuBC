from rest_framework import filters
from django_filters import FilterSet

from finance.models import (
    Project,
    FinancialRequest,
)

class ProjectFilter(FilterSet):
    """
    filter projects by type and status
    """
    class Meta:
        model = Project
        fields = ['type', 'status', 'project_starter']


class FinancialRequestFilter(FilterSet):
    """
    filter financial requests by type, status, and requested_at
    """
    class Meta:
        model = FinancialRequest
        fields = ['type', 'status', 'requested_at']

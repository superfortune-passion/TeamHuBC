from rest_framework import filters
from django_filters import FilterSet
from user.models import User, Team

class DeveloperReportFilter(FilterSet):
    """
    filter financial reports by developer and team
    """
    class Meta:
        model = User
        fields = ['id', 'team']


class TeamReportFilter(FilterSet):
    """
    filter financial reports by team id and name
    """
    class Meta:
        model = Team
        fields = ['id', 'name']

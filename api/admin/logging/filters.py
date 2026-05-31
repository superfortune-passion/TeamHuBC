from rest_framework import filters
from django_filters import FilterSet, Filter

from reporting.models import Log


class LogsFilter(FilterSet):
    """
    filter logs by owner, team
    """
    team = Filter(field_name='owner__team')
    
    class Meta:
        model = Log
        fields = ['team', 'owner']

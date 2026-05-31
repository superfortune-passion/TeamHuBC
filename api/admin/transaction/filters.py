from rest_framework import filters
from django_filters import FilterSet, Filter

from finance.models import Transaction


class TransactionFilter(FilterSet):
    """
    filter transactions by created_at, team and type
    """
    team = Filter(field_name='financial_request__requester__team')
    type = Filter(field_name='financial_request__type')
    
    class Meta:
        model = Transaction
        fields = ['created_at', 'team', 'type']

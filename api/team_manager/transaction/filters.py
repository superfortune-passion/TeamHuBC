from rest_framework import filters
from django_filters import FilterSet, Filter

from finance.models import Transaction


class TransactionFilter(FilterSet):
    """
    filter transactions by created_at and type
    """
    type = Filter(field_name='financial_request__type')
    
    class Meta:
        model = Transaction
        fields = ['created_at', 'type']

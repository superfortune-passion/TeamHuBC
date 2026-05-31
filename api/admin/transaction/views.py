from rest_framework import viewsets
from django_filters.rest_framework import DjangoFilterBackend

from api.mixins import FilterByUserQsMixin
from api.permission import IsAdmin
from api.common.finance.serializers import TransactionDetailSerializer, TransactionCreateSerializer
from .filters import TransactionFilter
from finance.models import Transaction


class TransactionViewSet(FilterByUserQsMixin, viewsets.ModelViewSet):
    permission_classes = [IsAdmin]
    filter_backends = (DjangoFilterBackend,)
    filterset_class = TransactionFilter
    queryset = Transaction.objects.all().order_by('-created_at')

    def get_queryset(self):
        return super().get_queryset().filter_by_period(self.request.query_params)

    def get_serializer_class(self):
        if self.request.method in ['PUT', 'POST', 'PATCH']:
            return TransactionCreateSerializer
        return TransactionDetailSerializer

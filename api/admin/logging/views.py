from api.mixins import FilterByUserQsMixin
from rest_framework.generics import ListAPIView, RetrieveAPIView, CreateAPIView
from rest_framework.permissions import IsAuthenticated
from django_filters.rest_framework import DjangoFilterBackend
import datetime

from api.common.logging.serializers import LogDetailSerializer
from reporting.models import Log
from api.permission import IsAdmin
from .filters import LogsFilter


class DailyLogsView(FilterByUserQsMixin, ListAPIView):
    queryset = Log.objects.daily_logs()
    serializer_class = LogDetailSerializer
    permission_classes = [IsAdmin]
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['owner']


class DailyLogsForCertainDateView(FilterByUserQsMixin, ListAPIView):
    queryset = Log.objects.all()
    serializer_class = LogDetailSerializer
    permission_classes = [IsAdmin]
    filter_backends = [DjangoFilterBackend]
    filterset_class = LogsFilter

    def get_queryset(self):
        year = self.kwargs['year']
        month = self.kwargs['month']
        day = self.kwargs['day']
        dt = datetime.date(year, month, day)
        return super().get_queryset().daily_logs_for_date(dt)


class DailyLogDetailView(FilterByUserQsMixin, RetrieveAPIView):
    serializer_class = LogDetailSerializer
    permission_classes = [IsAdmin]
    queryset = Log.objects.daily_logs()


class WeeklyLogsView(FilterByUserQsMixin, ListAPIView):
    serializer_class = LogDetailSerializer
    permission_classes = [IsAdmin]
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['owner']
    queryset = Log.objects.weekly_logs()


class WeeklyLogsforCertainWeekView(FilterByUserQsMixin, ListAPIView):
    queryset = Log.objects.all()
    serializer_class = LogDetailSerializer
    permission_classes =[IsAdmin]
    filter_backends = [DjangoFilterBackend]
    filterset_class = LogsFilter

    def get_queryset(self):
        year = self.kwargs['year']
        week = self.kwargs['week']
        return super().get_queryset().weekly_logs_for_week(year, week)


class WeeklyLogDetailView(FilterByUserQsMixin, RetrieveAPIView):
    queryset = Log.objects.weekly_logs()
    serializer_class = LogDetailSerializer
    permission_classes = [IsAdmin]


class MonthlyLogsView(FilterByUserQsMixin, ListAPIView):
    serializer_class = LogDetailSerializer
    permission_classes = [IsAdmin]
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['owner']
    queryset = Log.objects.monthly_logs()


class MonthlyLogsForCertainMonthView(FilterByUserQsMixin, ListAPIView):
    serializer_class = LogDetailSerializer
    permission_classes = [IsAdmin]
    filter_backends = [DjangoFilterBackend]
    filterset_class = LogsFilter
    queryset = Log.objects.all()
    def get_queryset(self):
        year = self.kwargs['year']
        month = self.kwargs['month']
        return super().get_queryset().monthly_logs_for_month(year, month)


class MonthlyLogDetailView(FilterByUserQsMixin, RetrieveAPIView):
    serializer_class = LogDetailSerializer
    permission_classes = [IsAdmin]
    queryset = Log.objects.monthly_logs()

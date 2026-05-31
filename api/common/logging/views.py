from rest_framework.generics import (
    ListAPIView,
    RetrieveAPIView,
    CreateAPIView,
    RetrieveUpdateDestroyAPIView,
    get_object_or_404
)
from rest_framework.permissions import IsAuthenticated
import datetime
from api.common.logging.serializers import MyLogSerializer
from reporting.models import Log


class MyLogCreateView(CreateAPIView):
    serializer_class = MyLogSerializer
    permission_class = [IsAuthenticated]

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)


class MyDailyLogView(RetrieveAPIView):
    serializer_class = MyLogSerializer
    permission_classes = [IsAuthenticated]
    today = datetime.date.today()

    def get_queryset(self):
        return Log.objects.my_daily_log_for_certain_date(self.request.user, self.today)

    def get_object(self):
        queryset = self.filter_queryset(self.get_queryset())
        filter_kwargs = {'created_at': self.today}
        obj = get_object_or_404(queryset, **filter_kwargs)
        # May raise a permission denied
        self.check_object_permissions(self.request, obj)
        return obj


class MyWeeklyLogView(RetrieveAPIView):
    serializer_class = MyLogSerializer
    permission_classes = [IsAuthenticated]
    now = datetime.datetime.now()
    year = now.year
    week = int(now.strftime('%W'))
    def get_queryset(self):
        return Log.objects.my_weekly_log_for_certain_week(self.request.user, self.year, self.week)
    
    def get_object(self):
        queryset = self.filter_queryset(self.get_queryset())
        filter_kwargs = {'created_at__year': self.year, 'created_at__week': self.week}
        obj = get_object_or_404(queryset, **filter_kwargs)
        # May raise a permission denied
        self.check_object_permissions(self.request, obj)
        return obj


class MyMonthlyLogView(RetrieveAPIView):
    serializer_class = MyLogSerializer
    permission_classes = [IsAuthenticated]
    now = datetime.datetime.now()
    dt = datetime.date(now.year, now.month, 1)

    def get_queryset(self):
        return Log.objects.my_monthly_log_for_certain_month(self.request.user, self.dt)

    def get_object(self):
        queryset = self.filter_queryset(self.get_queryset())
        filter_kwargs = {'created_at': self.dt}
        obj = get_object_or_404(queryset, **filter_kwargs)
        # May raise a permission denied
        self.check_object_permissions(self.request, obj)
        return obj


def get_date_with_anyday(self):
    year = self.kwargs['year']
    month = self.kwargs['month']
    day = self.kwargs['day']
    return datetime.date(year, month, day)


class MyDailyLogForCertainDateView(RetrieveAPIView):
    serializer_class = MyLogSerializer
    permission_classes = [IsAuthenticated]
    def get_queryset(self):
        return Log.objects.my_daily_log_for_certain_date(self.request.user, get_date_with_anyday(self))
    
    def get_object(self):
        queryset = self.filter_queryset(self.get_queryset())
        filter_kwargs = {'created_at': get_date_with_anyday(self)}
        obj = get_object_or_404(queryset, **filter_kwargs)
        # May raise a permission denied
        self.check_object_permissions(self.request, obj)
        return obj


class MyWeeklyLogForCertainWeekView(RetrieveAPIView):
    serializer_class = MyLogSerializer
    permission_classes = [IsAuthenticated]
    def get_queryset(self):
        return Log.objects.my_weekly_log_for_certain_week(self.request.user, self.kwargs['year'], self.kwargs['week'])
    
    def get_object(self):
        queryset = self.filter_queryset(self.get_queryset())
        filter_kwargs = {'created_at__year': self.kwargs['year'], 'created_at__week': self.kwargs['week']}
        obj = get_object_or_404(queryset, **filter_kwargs)
        # May raise a permission denied
        self.check_object_permissions(self.request, obj)
        return obj


def get_date_with_firstday(self):
    year = self.kwargs['year']
    month = self.kwargs['month']
    return datetime.date(year, month, 1)


class MyMonthlyLogForCertainMonthView(RetrieveAPIView):
    serializer_class = MyLogSerializer
    permission_classes = [IsAuthenticated]
    def get_queryset(self):
        return Log.objects.my_monthly_log_for_certain_month(self.request.user, get_date_with_firstday(self))
    
    def get_object(self):
        queryset = self.filter_queryset(self.get_queryset())
        filter_kwargs = {'created_at': get_date_with_firstday(self)}
        obj = get_object_or_404(queryset, **filter_kwargs)
        # May raise a permission denied
        self.check_object_permissions(self.request, obj)
        return obj


class RetrieveUpdateDestroyLogView(RetrieveUpdateDestroyAPIView):
    serializer_class = MyLogSerializer
    permission_classes = [IsAuthenticated]
    queryset = Log.objects.all()

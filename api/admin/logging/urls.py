from django.urls import path

from .views import (
    DailyLogsView,
    DailyLogDetailView,
    DailyLogsForCertainDateView,
    MonthlyLogsView,
    MonthlyLogsForCertainMonthView,
    MonthlyLogDetailView,
    WeeklyLogsView,
    WeeklyLogsforCertainWeekView,
    WeeklyLogDetailView
)


urlpatterns = [
    path('daily-logs/', DailyLogsView.as_view(), name='logging_for_all_day'),
    path('daily-logs/<int:year>-<int:month>-<int:day>/', DailyLogsForCertainDateView.as_view(), name='logging_for_certain_day'),
    path('daily-logs/<int:pk>/', DailyLogDetailView.as_view(), name='detail_logging_daily'),
    path('monthly-logs/', MonthlyLogsView.as_view(), name="logging_for_all_month"), 
    path('monthly-logs/<int:year>-<int:month>/', MonthlyLogsForCertainMonthView.as_view(), name="logging_for_certain_month"),
    path('monthly-logs/<int:pk>/', MonthlyLogDetailView.as_view(), name="detail_logging_monthly"),
    path('weekly-logs/', WeeklyLogsView.as_view(), name='logging_for_all_week'),
    path('weekly-logs/<int:year>-<int:week>/', WeeklyLogsforCertainWeekView.as_view(), name='logging_for_certain_week'),
    path('weekly-logs/<int:pk>/', WeeklyLogDetailView.as_view(), name='detail_logging_weekly'),
]
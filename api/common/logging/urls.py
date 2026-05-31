from django.urls import path

from .views import (
    MyLogCreateView,
    MyDailyLogView,
    MyWeeklyLogView,
    MyMonthlyLogView,
    MyDailyLogForCertainDateView,
    MyWeeklyLogForCertainWeekView,
    MyMonthlyLogForCertainMonthView,
    RetrieveUpdateDestroyLogView,
)


urlpatterns = [
    path('', MyLogCreateView.as_view(), name='my_log_create'),
    path('<int:pk>/', RetrieveUpdateDestroyLogView.as_view(), name='retrieve_update_destroy_log'),
    path('daily/',MyDailyLogView.as_view(), name='my_daily_log_today'),
    path('weekly/',MyWeeklyLogView.as_view(), name='my_weekly_log_thisweek'),
    path('monthly/',MyMonthlyLogView.as_view(), name='my_monthly_log_thismonth'),
    path('daily/<int:year>-<int:month>-<int:day>/',MyDailyLogForCertainDateView.as_view(), name='my_daily_log_certain_date'),
    path('weekly/<int:year>-<int:week>/',MyWeeklyLogForCertainWeekView.as_view(), name='my_weekly_log_certain_week'),
    path('monthly/<int:year>-<int:month>/',MyMonthlyLogForCertainMonthView.as_view(), name='my_monthly_log_certain_month'),  
]

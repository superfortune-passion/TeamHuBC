from django.urls import path

from .views import (
    WeeklyIncomeView,
    OngoingProjectsView,
    PendingRequestsView,
    StatsView,
    ApprovedRequestView
)

urlpatterns = [
    path('weekly-income/', WeeklyIncomeView.as_view(), name='dashboard_weekly_incoming'),
    path('ongoing-projects/', OngoingProjectsView.as_view(), name='dashboard_ongoing_projects'),
    path('pending-requests/', PendingRequestsView.as_view(), name='dashboard_pending_requests'),
    path('stats/', StatsView.as_view(), name='dashboard_stats'),
    path('approved-requests/', ApprovedRequestView.as_view(), name='dashboard_approved_requests'),
]

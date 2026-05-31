from django.urls import path

from .views import (
    ReportDeveloperListView,
    ReportDeveloperDetailView,
    ReportProjectEarningsListView,
    ReportTotalView
)

urlpatterns = [
    path('total/', ReportTotalView.as_view(), name='report_total'),
    path('developers/', ReportDeveloperListView.as_view(), name="report_developer"),
    path('developers/<int:pk>/', ReportDeveloperDetailView.as_view(), name='report_individual_developer'),
    path('developers/<int:pk>/projects/', ReportProjectEarningsListView.as_view(), name='project_report_individual_report'),
]

from django.urls import path

from .views import (
    ReportDeveloperView,
    ReportProjectEarningsListView
)


urlpatterns = [
    path('earning/', ReportDeveloperView.as_view(), name='developer_earning'),
    path('project_earnings/', ReportProjectEarningsListView.as_view(), name='developer_project_earnings'),
]

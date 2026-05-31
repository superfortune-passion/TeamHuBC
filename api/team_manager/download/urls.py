from django.urls import path

from .views import (
    ReportDeveloperListDownloadView,
    ReportDeveloperDetailDownloadView,
    ReportDeveloperProjectDownloadView,
    TransactionDownloadView
)

urlpatterns = [
    path('developers/', ReportDeveloperListDownloadView.as_view(), name='report_developer_list_download'),
    path('developers/<int:pk>/', ReportDeveloperDetailDownloadView.as_view(), name='report_developer_detail_download'),
    path('developers/<int:pk>/projects/', ReportDeveloperProjectDownloadView.as_view(), name='report_developer_project_download'),
    path('transactions/', TransactionDownloadView.as_view(), name='transaction_list_download')
]

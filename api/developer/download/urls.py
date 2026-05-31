from django.urls import path

from .views import (
    ReportDeveloperProjectDownloadView,
    TransactionDownloadView
)

urlpatterns = [
    path('projects/', ReportDeveloperProjectDownloadView.as_view(), name='report_developer_project_download'),
    path('transactions/', TransactionDownloadView.as_view(), name='report_developer_transaction_download')
]

from rest_framework import routers
from django.urls import path

from api.common.finance.views import FinancialRequestViewSet
from .views import CancelFinanicalRequestView


router = routers.DefaultRouter()
router.register('', FinancialRequestViewSet)

urlpatterns = router.urls + [
    path('<int:pk>/cancel/', CancelFinanicalRequestView.as_view(), name='cancel_financial_request'),
]

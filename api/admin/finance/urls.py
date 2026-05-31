from django.urls import path
from rest_framework import routers

from api.common.finance.views import FinancialRequestViewSet
from .views import ApproveFinanicalRequestView, DeclineFinanicalRequestView


router = routers.DefaultRouter()
router.register('', FinancialRequestViewSet)

urlpatterns = router.urls + [
    path('<int:pk>/approve/', ApproveFinanicalRequestView.as_view(), name='approve_financial_requests'),
    path('<int:pk>/decline/', DeclineFinanicalRequestView.as_view(), name='decline_financial_requests'),
]

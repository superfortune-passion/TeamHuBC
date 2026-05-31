from django.urls import  include, path
from rest_framework import routers
from api.common.finance.views import ClientViewSet, PartnerViewSet, ProjectViewSet, PaymentAccountView
from api.common.user.views import ProfilesAdminViewSet, AccountsAdminViewSet, AccountPlatformView
from api.developer.transaction.views import TransactionViewSet


router = routers.DefaultRouter()
router.register('clients', ClientViewSet)
router.register('partners', PartnerViewSet)
router.register('projects', ProjectViewSet)
router.register('profiles', ProfilesAdminViewSet)
router.register('accounts', AccountsAdminViewSet, basename='accounts')
router.register('transactions', TransactionViewSet, basename="transactions")


urlpatterns = router.urls + [
    path('financial-requests/', include('api.developer.finance.urls')),
    path('dashboard/', include('api.common.dashboard.urls')),
    path('notifications/', include('api.common.notification.urls')),
    path('my-logs/', include('api.common.logging.urls')),
    path('report/earnings/', include('api.developer.report.urls')),
    path('downloads/report/', include('api.developer.download.urls')),
    path('payment-accounts/', PaymentAccountView.as_view(), name='payment_accounts'),
    path('platforms/', AccountPlatformView.as_view(), name='account_platforms'),
]

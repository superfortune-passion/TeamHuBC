from django.urls import  include, path
from rest_framework import routers
from .user.views import TeamView, TeamUserListView
from api.common.user.views import ProfilesAdminViewSet, AccountsAdminViewSet, AccountPlatformView
from api.common.finance.views import ClientViewSet, PartnerViewSet, ProjectViewSet, PaymentAccountView
from api.team_manager.transaction.views import TransactionViewSet

router = routers.DefaultRouter()
# router.register('users/', UserTeamViewSet)


#api end-points for finance app
router.register('clients', ClientViewSet)
router.register('partners', PartnerViewSet)
router.register('projects', ProjectViewSet)
router.register('profiles', ProfilesAdminViewSet)
router.register('accounts', AccountsAdminViewSet, basename='accounts')
router.register('transactions', TransactionViewSet, basename="transactions")


urlpatterns = [
    path('team/', TeamView.as_view(), name='team'),
    path('users/', include('api.common.user.urls')),
    path('financial-requests/', include('api.team_manager.finance.urls')),
    path('dashboard/', include('api.common.dashboard.urls')),
    path('logging/', include('api.team_manager.logging.urls')),
    path('notifications/', include('api.common.notification.urls')),
    path('my-logs/', include('api.common.logging.urls')),
    path('report/earnings/', include('api.team_manager.report.urls')),
    path('downloads/report/', include('api.team_manager.download.urls')),
    path('payment-accounts/', PaymentAccountView.as_view(), name='payment_accounts'),
    path('platforms/', AccountPlatformView.as_view(), name='account_platforms'),
] + router.urls

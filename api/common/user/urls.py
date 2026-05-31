from rest_framework import routers
from django.urls import path

from .views import UserViewSet, ProfileListAdminView


router = routers.DefaultRouter()
router.register('', UserViewSet, basename="users")

urlpatterns = router.urls + [
    path('<int:pk>/profiles/', ProfileListAdminView.as_view(), name='user_profiles'),
]

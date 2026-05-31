from django.urls import path
from .views import UserViewSets
from rest_framework import routers

app_name = 'user'
router = routers.DefaultRouter()
router.register('', UserViewSets)
urlpatterns = router.urls



from django.urls import path
from . import views
from api.common.user.views import ChangePasswordView

urlpatterns = [
    path('login/', views.LoginView.as_view(), name='login'),
    path('register/', views.RegisterView.as_view(), name='register'),
    path('me/', views.MeView.as_view(), name='me'),
    path('update-password/', ChangePasswordView.as_view(), name='change_password' ),
]

from django.urls import  include, path
from .user.views import (
    SearchUserView,
    SearchProfileView,
    SearchPartnerView,
    SearchClientView,
    SearchProjectView
)

urlpatterns = [
    path('users/', SearchUserView.as_view(), name='search_user'),
    path('profiles/', SearchProfileView.as_view(), name='search_profile'),
    path('partners/', SearchPartnerView.as_view(), name='search_partner'),
    path('clients/', SearchClientView.as_view(), name='search_client'),
    path('projects/', SearchProjectView.as_view(), name='search_project'),
]
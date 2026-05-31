from django.urls import path

from .views import TeamUserListView


urlpatterns = [
  path('', TeamUserListView.as_view(), name='users')
]

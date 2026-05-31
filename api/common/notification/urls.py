from django.urls import  path

from api.common.notification.views import NotificationListView, NotificationUpdateView, NotificationUpdateListView

urlpatterns = [
    path('', NotificationListView.as_view(), name='unread_notification_lists'),
    path('<int:pk>/read/', NotificationUpdateView.as_view(), name='update_unread_notification'),
    path('read-all/', NotificationUpdateListView.as_view(), name='update_all_unread_notification'),
]

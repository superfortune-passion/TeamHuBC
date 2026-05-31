from rest_framework.generics import ListAPIView, UpdateAPIView, GenericAPIView
from rest_framework.views import APIView
from rest_framework.response import Response
from api.permission import IsAdminOrManager
from rest_framework.permissions import IsAuthenticated
from api.common.notification.serializers import NotificationListSerializer, NotificationUpdateSerializer
import datetime
from notification.models import Notification
from rest_framework import mixins


class NotificationListView(ListAPIView):
    serializer_class = NotificationListSerializer
    permission_classes = [IsAuthenticated]
    def get_queryset(self):
        return Notification.objects.unread_items(self.request.user)


class NotificationUpdateView(UpdateAPIView):
    serializer_class = NotificationUpdateSerializer
    permission_classes = [IsAuthenticated]
    def get_queryset(self):
        if self.request.user.is_anonymous:
            return Notification.objects.none()
        return Notification.objects.unread_items(self.request.user)
    def perform_update(self, serializer):
        serializer.instance.mark_as_read()

class NotificationUpdateListView(GenericAPIView):
    serializer_class = NotificationUpdateSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return Notification.objects.unread_items(self.request.user)

    def put(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())
        queryset.read_all()
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)
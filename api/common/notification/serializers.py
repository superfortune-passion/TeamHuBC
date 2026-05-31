from rest_framework import serializers

from notification.models import Notification
from user.models import User
from finance.models import FinancialRequest, Project
from reporting.models import Log


class NotificationFinancialRequestSerializer(serializers.ModelSerializer):
    class Meta:
        model = FinancialRequest
        fields = ('id', 'type','status')


class NotificationProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Project
        fields = ('id', 'title', 'type')


class NotificationLogSerializer(serializers.ModelSerializer):
    class Meta:
        model = Log
        fields = ('id', 'plan', 'achievements')


class NotificationObjectRelatedField(serializers.RelatedField):
    def to_representation(self, value):
        if isinstance(value, FinancialRequest):
            serializer = NotificationFinancialRequestSerializer(value)
        elif isinstance(value, Project):
            serializer = NotificationProjectSerializer(value)
        elif isinstance(value, Log):
            serializer = NotificationLogSerializer(value)
        return serializer.data


class NotificationUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'first_name','last_name','email')


class NotificationListSerializer(serializers.ModelSerializer):
    notify_to = NotificationUserSerializer()
    creator = NotificationUserSerializer()
    content_object = NotificationObjectRelatedField(read_only=True)
    content_name = serializers.SerializerMethodField()

    def get_content_name(self, obj):
        content_name = obj.content_type.app_label + "_" + obj.content_type.model
        if obj.content_type.app_label == 'reporting':
            content_name = content_name + "_" + obj.content_object.interval
        return content_name

    class Meta:
        model = Notification
        fields = ('id', 'notify_to', 'creator', 'message', 'content_name', 'content_object', 'read_at', 'created_at')


class NotificationUpdateSerializer(serializers.ModelSerializer):
    notify_to = NotificationUserSerializer(read_only=True)
    creator = NotificationUserSerializer(read_only=True)
    content_object = NotificationObjectRelatedField(read_only=True)
    content_name = serializers.SerializerMethodField()

    def get_content_name(self, obj):
        content_name = obj.content_type.app_label + "_" + obj.content_type.model
        if obj.content_type.app_label == 'reporting':
            content_name = content_name + "_" + obj.content_object.interval
        return content_name

    class Meta:
        model = Notification
        fields = ('id', 'notify_to', 'creator', 'message',  'content_name','content_object', 'read_at', 'created_at')
        read_only_fields = ('id', 'notify_to', 'creator', 'message', 'content_object', 'read_at')

from rest_framework import serializers
from reporting.models import Log
from ..user.serializers import UserSerializer


class MyLogSerializer(serializers.ModelSerializer):
    class Meta:
        model = Log
        fields = ('id', 'plan', 'achievements', 'created_at', 'updated_at', 'interval')


class LogDetailSerializer(serializers.ModelSerializer):
    owner = UserSerializer()
  
    class Meta:
        model = Log
        fields = ('id', 'owner', 'plan', 'achievements', 'created_at', 'updated_at', 'interval')
        read_only_fields = ('id', 'owner')

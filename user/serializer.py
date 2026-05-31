from rest_framework import serializers

from .models import AccountPlatform


class AccountPlatformSerializer(serializers.ModelSerializer):
    class Meta:
        model = AccountPlatform
        fields = ('id', 'name')

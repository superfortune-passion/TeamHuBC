from rest_framework import serializers
from user.models import (
    User,
    Profile
)
from finance.models import (
    Partner,
    Client,
    Project
)

class SearchUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'first_name', 'last_name')


class SearchProfileSerializer(serializers.ModelSerializer):
    full_name = serializers.SerializerMethodField()

    def get_full_name(self, obj):
        return obj.first_name + ' ' + obj.last_name
    
    class Meta:
        model = Profile
        fields = ('id', 'full_name')


class SearchPartnerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Partner
        fields = ('id', 'full_name')


class SearchClientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Client
        fields = ('id', 'full_name')


class SearchProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Project
        fields = ('id', 'title')

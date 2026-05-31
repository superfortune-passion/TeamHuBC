import numpy as np
from rest_framework import serializers
from user.models import User, Team
from finance.models import Project


class ReportProjectEarningsSerializer(serializers.ModelSerializer):
    project_earning = serializers.SerializerMethodField()

    def get_project_earning(self, obj):
        return obj.earning

    class Meta:
        model = Project
        fields = ('title', 'project_earning')


class ReportDeveloperSerializer(serializers.ModelSerializer):
    earning = serializers.SerializerMethodField()

    def get_earning(self, obj):
        return obj.total

    class Meta:
        model = User
        fields = ('id', 'first_name', 'last_name', 'earning')


class ReportDeveloperEarningSerializer(serializers.Serializer):
    earning = serializers.SerializerMethodField()

    def get_earning(self, obj):
        return obj.total


class ReportTeamSerializer(serializers.ModelSerializer):
    earnings = serializers.SerializerMethodField()

    def get_earnings(self, obj):
        return obj.total

    class Meta:
        model = Team
        fields = ('id', 'name', 'earnings')

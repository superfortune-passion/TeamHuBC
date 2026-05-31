from user.models import User, Team
from rest_framework import serializers


class TeamUserListSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'email', 'username', 'first_name', 'last_name', 'role',)

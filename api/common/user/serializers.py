from user.models import User, Team
from rest_framework import serializers


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'email', 'username', 'first_name', 'last_name', 'role', 'team')


class ChangePasswordSerializer(serializers.Serializer):
    current_password = serializers.CharField()
    new_password = serializers.CharField()
    def validate_current_password(self, data):
        user = self.context.get('user')
        if not user.check_password(data):
            raise serializers.ValidationError('Current password does not match.')
        return data

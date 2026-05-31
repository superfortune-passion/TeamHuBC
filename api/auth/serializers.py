from rest_framework import serializers
from user.models import User


class RoleValidatorMixin(object):
    def validate_role(self, value):
        # if 'django' not in value.lower():
        #     raise serializers.ValidationError("Blog post is not about Django")
        user = self.context['request'].user
        if user.is_manager and value in ['admin',]:
             raise serializers.ValidationError('User manager is not allowed to set admin role.')
        if user.is_user and value in ['admin', 'manager']:
             raise serializers.ValidationError('Regular user is allowed to change the role.')
        return value


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'first_name', 'last_name', 'email', 'role', 'username')


class UserCreateSerializer(serializers.ModelSerializer, RoleValidatorMixin):
    class Meta:
        model = User
        fields = ('id', 'first_name', 'last_name', 'email', 'role', 'password', 'team', 'username')
        read_only_fields = ('id', 'role')
        extra_kwargs = { 'password': { 'write_only': True } }

    def create(self, validated_data):
        user = super(UserCreateSerializer, self).create(validated_data)
        user.set_password(validated_data['password'])
        user.save()
        return user
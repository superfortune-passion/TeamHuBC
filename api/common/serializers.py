from rest_framework import serializers

from user.models import User, Profile, Account, Team
from .user.serializers import UserSerializer
from user.serializer import AccountPlatformSerializer

class TeamSerializer(serializers.ModelSerializer):
    class Meta:
        model = Team
        fields = ('id', 'name')


class UserLinkedWithProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'first_name', 'last_name')


class ProfileLinkedWithAccountSerializer(serializers.ModelSerializer):
    user = UserLinkedWithProfileSerializer(required=False, read_only=True)
    class Meta:
        model = Profile
        fields = ('id', 'first_name', 'last_name', 'user')


class AccountSerializer(serializers.ModelSerializer):
    profile = ProfileLinkedWithAccountSerializer(required=False, read_only=True)
    account_platform = AccountPlatformSerializer(required=False, read_only=True)

    class Meta:
        model = Account
        fields = (
            'id',
            'account_platform',
            'email',
            'password',
            'location',
            'extra_info',
            'url',
            'profile'
        )
        read_only_fields = ('profile',)


class AccountUpdateSerializer(serializers.ModelSerializer):
    # account_platform = AccountPlatformSerializer(required=False)

    class Meta:
        model = Account
        fields = (
            'id',
            'account_platform',
            'email',
            'password',
            'location',
            'extra_info',
            'url',
            'profile'
        )
# Handle nested Serializer : I give up!


class ProfileAccountSerializer(serializers.ModelSerializer):
    account_platform = AccountPlatformSerializer(required=False, read_only=True)

    class Meta:
        model = Account
        fields = (
            'id',
            'account_platform',
            'email',
            'password',
            'location',
            'extra_info',
            'url',
            'profile'
        )


class ProfileSerializer(serializers.ModelSerializer):
    accounts = ProfileAccountSerializer(many=True, source='account_set', required=False)
    user = UserSerializer(required=False, )

    def create(self, validated_data):
        accounts = validated_data.pop('account_set', None)
        instance = super().create(validated_data)
        if accounts is not None:
            accounts_ser = AccountSerializer(data=accounts, many=True)
            accounts_ser.is_valid(raise_exception=True)
            instance.account_set.all().delete()
            accounts_ser.save(profile=instance)
        return instance
    
    def validate(self, data):
        user_id = self.initial_data['user_id']
        user = User.objects.get(pk=user_id)
        data.update({ 'user': user })
        return data

    class Meta:
        model = Profile
        fields = (
            'id',
            'profile_type',
            'first_name',
            'last_name',
            'address',
            'country',
            'dob',
            'gender',
            'user_id',
            'accounts',
            'user',
            'extra_info'
        )
        read_only_fields = ('user',)


class UserProfileSerializer(serializers.ModelSerializer):
    accounts = ProfileAccountSerializer(many=True, source='account_set', required=False)

    class Meta:
        model = Profile
        fields = (
            'id',
            'profile_type',
            'first_name',
            'last_name',
            'address',
            'country',
            'dob',
            'gender',
            'accounts',
            'extra_info'
        )
    

class UserDetailSerializer(serializers.ModelSerializer):
    team = TeamSerializer(read_only=True)
    profiles = UserProfileSerializer(many=True, source='profile_set', required=False)

    class Meta:
        model = User
        fields = (
            'id',
            'first_name',
            'last_name',
            'email',
            'role',
            'team',
            'profiles',
        )
        read_only_fields = ('team', 'profiles')


# Handle nested Serializer : I give up!
class UserDetailUpdateSerializer(serializers.ModelSerializer):
    profiles = ProfileSerializer(many=True, source='profile_set', required=False)

    def validate(self, data):
        if self.initial_data.get('email', None):
            data['username'] = self.initial_data.get('email')
        return data
    
    def update(self, instance, validated_data):
        # # Update team data
        # team = validated_data.pop('team', None)
        # if team is not None:
        #     team_ser = TeamSerializer(data=team)
        #     team_ser.is_valid(raise_exception=True)
        #     validated_data['team'] = team_ser.save()

        # Update profile data
        profiles = validated_data.pop('profile_set', None)
        if profiles is not None:
            profiles_ser = ProfileSerializer(data=profiles, many=True)
            profiles_ser.is_valid(raise_exception=True)
            instance.profile_set.all().delete()
            profiles_ser.save(user=instance)

        return super().update(instance, validated_data)

    class Meta:
        model = User
        fields = (
            'id',
            'first_name',
            'last_name',
            'email',
            'role',
            'team',
            'profiles',
        )

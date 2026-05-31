from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import viewsets, views, status
from rest_framework.decorators import action
from rest_framework.filters import SearchFilter
from rest_framework.generics import ListAPIView
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from api.mixins import FilterByUserQsMixin
from ...common.serializers import (
    TeamSerializer,
    UserDetailSerializer,
    UserDetailUpdateSerializer,
    ProfileSerializer,
    AccountSerializer,
    AccountUpdateSerializer
)
from ...permission import IsAdmin, IsAdminOrManager, IsTeamManager, IsTeamManagerOrDeveloper
from .filters import ProfileFilter
from .serializers import UserSerializer, ChangePasswordSerializer
from user.constants import ROLE_TEAM_MANAGER, ROLE_DEVELOPER
from user.models import User, Team, Profile, Account, AccountPlatform
from user.serializer import AccountPlatformSerializer


class UserViewSet(viewsets.ModelViewSet):
    permission_classes = [IsAdminOrManager]
    filter_backends = [SearchFilter]
    search_fields = ['@username', '^first_name', '@last_name']

    def get_queryset(self):
        user = self.request.user
        if user.is_anonymous:
            return User.objects.none()
        if user.is_admin:
            return User.objects.filter(team__in=user.teams)
        else:
            return User.objects.filter(team=self.request.user.team)
    
    def get_serializer_class(self):
        if self.action == 'list':
            return UserSerializer
        elif self.request.method == 'PUT' or self.request.method == 'PATCH' or self.request.method == 'POST':
            return UserDetailUpdateSerializer
        else:
            return UserDetailSerializer


class ChangePasswordView(views.APIView):
    permission_classes = [IsAuthenticated]
    serializer_class = ChangePasswordSerializer
    def put(self, request):
        serializer = ChangePasswordSerializer(data=request.data, context={'user':request.user})
        if serializer.is_valid(raise_exception=True):
            request.user.set_password(serializer.validated_data['new_password'])
            request.user.save()
            return Response('Your password has been changed successfully', status=status.HTTP_200_OK)
        

class TeamViewSet(viewsets.ModelViewSet):
    serializer_class = TeamSerializer
    permission_classes = [IsAdmin]

    def get_queryset(self):
        return self.request.user.teams

    @action(detail=False, permission_classes=[IsAdmin], url_path='unassigned-users')
    def unassigned_users(self, request, *args, **kwargs):
        SerializerClass = UserSerializer
        serializer = SerializerClass(
            User.objects.filter(role__in=[ROLE_DEVELOPER, ROLE_TEAM_MANAGER], team__isnull=True), 
            many=True
        )
        return Response(serializer.data)
    
    @action(detail=True, permission_classes=[IsAdmin], url_path='members')
    def members(self, request, *args, **kwargs):
        SerializerClass = UserSerializer
        serializer = SerializerClass(
            User.objects.filter(team=self.kwargs['pk']),
            many=True
        )
        return Response(serializer.data)


class ProfileListAdminView(ListAPIView):
    serializer_class = ProfileSerializer
    permission_classes = [IsAdmin]
    filter_backends = [DjangoFilterBackend]
    filterset_class = ProfileFilter
    
    def get_queryset(self):
        return Profile.objects.filter(user_id=self.kwargs.get('pk'))


class ProfilesAdminViewSet(FilterByUserQsMixin, viewsets.ModelViewSet):
    serializer_class = ProfileSerializer
    queryset = Profile.objects.all()
    permission_classes = [IsAuthenticated]
    filter_backends = [SearchFilter]
    search_fields = [
        'user__first_name',
        'user__last_name',
        'first_name',
        'last_name',
        'address',
        'country'
    ]


class AccountListByProfileIdView(ListAPIView):
    serializer_class = AccountSerializer
    permission_classes = [IsAdmin]

    def get_queryset(self):
        return Account.objects.filter(profile_id=self.kwargs.get('pk'))


class AccountsAdminViewSet(viewsets.ModelViewSet):
    serializer_class = AccountSerializer
    permission_classes = [IsAuthenticated]
    filter_backends = [SearchFilter]
    search_fields = [
        'profile__user__first_name',
        'profile__user__last_name',
        'profile__first_name',
        'profile__last_name',
        'email',
        'location',
        'url',
        'account_platform__name'
    ]


    def get_serializer_class(self):
        if self.request.method == 'PUT' or self.request.method == 'POST':
            return AccountUpdateSerializer
        else:
            return AccountSerializer
    
    def get_queryset(self):
        user = self.request.user
        qs = Account.objects.filter(profile__user__team__in=user.teams)
        if user.is_anonymous:
            return qs.none()
        elif user.is_developer:
            return Account.objects.filter(profile__user=user)
        elif user.is_team_manager:
            return Account.objects.filter(profile__user__in=user.team_members)

        owner_pk = self.request.query_params.get('owner', None)
        if owner_pk is not None:
            qs = qs.filter(profile__user=owner_pk)
        return qs


class AccountPlatformView(ListAPIView):
    permission_classes = [IsTeamManagerOrDeveloper]
    queryset = AccountPlatform.objects.all()
    serializer_class = AccountPlatformSerializer

from rest_framework import permissions

from user.models import User

__all__ = ['IsDeveloper', 'IsTeamManager', 'IsAdmin']


class IsDeveloper(permissions.BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated and request.user.is_developer


class IsTeamManager(permissions.BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated and request.user.is_team_manager


class IsAdmin(permissions.BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated and request.user.is_admin


class IsAdminOrManager(permissions.BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated and (
            request.user.is_admin or request.user.is_team_manager
        )


class IsTeamManagerOrDeveloper(permissions.BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated and (
            request.user.is_team_manager or request.user.is_developer
        )

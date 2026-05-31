from django.contrib.auth.models import UserManager as BaseUserManager
from django.db.models.query import QuerySet
from . import constants


class UserManager(BaseUserManager):
    def filter_admins(self):
        return super().get_queryset().filter(role=constants.ROLE_ADMIN)

    def filter_team_managers(self):
        return super().get_queryset().filter(role=constants.ROLE_TEAM_MANAGER)
    
    def filter_developers(self):
        return super().get_queryset().filter(role=constants.ROLE_DEVELOPER)


class ProfileQuerySet(QuerySet):
    def filter_by_user(self, user):
        if user.is_anonymous:
            return self.none()
        elif user.is_superuser:
            return self
        elif user.is_admin:
            return self.filter(user__team__in=user.teams)
        elif user.is_team_manager:
            return self.filter(user__in=user.team_members)
        else:
            return self.filter(user=user)

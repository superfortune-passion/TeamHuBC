from rest_framework import filters
from django_filters import FilterSet

from user.models import User
from finance.models import Project


class UserFilter(FilterSet):
    """
    Filter users by team
    """
    class Meta:
        model = User
        fields = ['team']

class ProjectFilter(FilterSet):
    """
    Filter projects by project_starter
    """
    class Meta:
        model = Project
        fields = ['project_starter']

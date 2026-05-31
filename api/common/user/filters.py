from rest_framework import filters
from django_filters import Filter, FilterSet

from user.models import Profile, Account


class ProfileFilter(FilterSet):
    """
    filter profiles by user
    """
    class Meta:
        model = Profile
        fields = ['user']

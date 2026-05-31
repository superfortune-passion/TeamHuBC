from django.utils.functional import cached_property
from .managers import LogQuerySet
from django.db import models
from . import constants


class Log(models.Model):
    owner = models.ForeignKey('user.User', on_delete=models.CASCADE)
    plan = models.TextField(null=True, blank=True)
    achievements = models.TextField(null=True, blank=True)
    created_at = models.DateField('Created Date of Log')
    updated_at = models.DateTimeField('Updated Date of Log', auto_now=True)
    interval = models.CharField(choices=constants.REPORTING_INTERVAL, max_length=20)

    objects = LogQuerySet.as_manager()

    def __str__(self):
        return '{} log for {} ({})'.format(self.interval, self.owner, self.created_at)

    class Meta:
        unique_together = ['owner', 'created_at', 'interval']

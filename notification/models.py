from django.db import models
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey
import datetime
from .managers import NotificationManager


class Notification(models.Model):
    notify_to = models.ForeignKey('user.User', on_delete=models.CASCADE, related_name='received_notifications')
    creator = models.ForeignKey('user.User', on_delete=models.CASCADE, related_name='created_notifications')
    message = models.TextField('Notification message', null=True)
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type','object_id')
    read_at = models.DateTimeField(null=True, blank=True)
    created_at = models.DateTimeField('Created Date of Notification', auto_now_add=True)

    objects = NotificationManager()

    def __str__(self):
        return '{} created by {}'.format(self.message, self.creator)

    def mark_as_read(self):
        self.read_at = datetime.datetime.now()
        self.save()

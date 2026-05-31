from django.db import models
import datetime


class NotificationQuerySet(models.QuerySet):
    def read_all(self):
        return self.update(read_at=datetime.datetime.now())


class NotificationManager(models.Manager):
    def get_queryset(self):
        return NotificationQuerySet(model=self.model, using=self._db, hints=self._hints).order_by('-created_at')

    def unread_items(self, owner):
        return self.get_queryset().filter(notify_to=owner, read_at__isnull=True)

    def read_items(self, owner):
        return self.get_queryset().filter(notify_to=owner, read_at__isnull=False)

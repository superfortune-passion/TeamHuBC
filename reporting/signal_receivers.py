from django.db.models.signals import post_save
from django.dispatch import receiver
import datetime

from .models import Log
from user.models import User
from notification.models import Notification


@receiver(post_save, sender=Log)
def create_notification_whenever_logged(sender, instance, created, **kwargs):
    if instance.owner.is_team_manager:
        for admin in User.objects.filter_admins():
            if admin.is_superuser or instance.owner.team in admin.teams:
                Notification.objects.unread_items(admin).filter(creator=instance.owner).update(read_at=datetime.datetime.now())
                Notification.objects.create(
                    notify_to=admin,
                    creator=instance.owner,
                    message='{{creator}} logged his {{object}}',
                    content_object=instance
                )
    if instance.owner.is_developer and instance.owner.team_manager is not None:
        Notification.objects.unread_items(instance.owner.team_manager).filter(creator=instance.owner).update(read_at=datetime.datetime.now())
        Notification.objects.create(
            notify_to=instance.owner.team_manager,
            creator=instance.owner,
            message='{{creator}} logged his {{object}}',
            content_object=instance
        )

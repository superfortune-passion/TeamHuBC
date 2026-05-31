from django.db.models.signals import pre_save, post_save
from django.dispatch import receiver

from .models import Project
from .models import FinancialRequest
from notification.models import Notification
from user.models import User
from .signals import fr_post_save
from . import constants as cs
from .utils import compare_object_by_attr


fr_attr_list = ['type', 'amount', 'address', 'project', 'description']


@receiver(post_save, sender=Project)
def create_notification_for_project_start(created, instance, **kwargs):
    if created:
        if instance.project_starter.team_manager is not None and instance.project_starter.is_developer:
            Notification.objects.create(
                notify_to = instance.project_starter.team_manager,
                creator = instance.project_starter,
                message='{{creator}} started his {{object}}.',
                content_object = instance
            )
        for admin in User.objects.filter_admins():
            if admin.is_superuser or instance.project_starter.team in admin.teams:
                Notification.objects.create(
                    notify_to=admin,
                    creator=instance.project_starter,
                    message='{{creator}} started his {{object}}.',
                    content_object=instance
                )


@receiver(pre_save, sender=Project)
def create_notification_for_project_status(instance, **kwargs):
    if instance.id:
        prev_inst = Project.objects.get(id=instance.id)
        if prev_inst.status == cs.PROJECT_STATUS_ONGOING and instance.status == cs.PROJECT_STATUS_PAUSED:
            if instance.project_starter.team_manager is not None:
                Notification.objects.create(
                    notify_to = instance.project_starter.team_manager,
                    creator = instance.project_starter,
                    message='{{creator}} paused his {{object}}.',
                    content_object = instance
                )
            for admin in User.objects.filter_admins():
                if admin.is_superuser or instance.project_starter.team in admin.teams:
                    Notification.objects.create(
                        notify_to=admin,
                        creator=instance.project_starter,
                        message='{{creator}} paused his {{object}}.',
                        content_object=instance
                    )

        if prev_inst.status != instance.status and instance.status == cs.PROJECT_STATUS_ENDED:
            if instance.project_starter.team_manager is not None:
                Notification.objects.create(
                    notify_to = instance.project_starter.team_manager,
                    creator = instance.project_starter,
                    message='{{creator}} stopped his {{object}}.',
                    content_object = instance
                )
            for admin in User.objects.filter_admins():
                if admin.is_superuser or instance.project_starter.team in admin.teams:
                    Notification.objects.create(
                        notify_to=admin,
                        creator=instance.project_starter,
                        message='{{creator}} stopped his {{object}}.',
                        content_object=instance
                    )


def get_message_for_admin_or_manager(prev_inst, new_inst):
    if prev_inst is not None:
        if prev_inst.status != new_inst.status and new_inst.status == cs.FINANCIAL_STATUS_CANCELED:
            return '{{creator}} canceled a {{object}}.'
        if prev_inst.status == new_inst.status and not compare_object_by_attr(prev_inst, new_inst, fr_attr_list):
            return '{{creator}} updated a {{object}}.'
        else:
            return None
    else:
        return '{{creator}} created a new {{object}}.'


def get_message_for_manager_or_developer(prev_inst, new_inst):
    if prev_inst is not None:
        if compare_object_by_attr(prev_inst, new_inst, fr_attr_list):
            if  new_inst.status == cs.FINANCIAL_STATUS_APPROVED:
                return '{{object}} has been approved.'
            if new_inst.status == cs.FINANCIAL_STATUS_DECLINED:
                return '{{object}} has been declined'


@receiver(fr_post_save, sender=FinancialRequest)
def create_financial_request_notification(sender, instance, prev_inst, **kwargs):
    if get_message_for_admin_or_manager(prev_inst, instance) is not None and instance.requester.is_developer and instance.requester.team_manager is not None:
          Notification.objects.create(
            notify_to=instance.requester.team_manager,
            creator=instance.requester,
            message= get_message_for_admin_or_manager(prev_inst, instance),
            content_object=instance
        )
    if get_message_for_admin_or_manager(prev_inst, instance) is not None and not instance.requester.is_admin:
        for admin in User.objects.filter_admins():
            if admin.is_superuser or instance.requester.team in admin.teams:
                Notification.objects.create(
                    notify_to=admin,
                    creator=instance.requester,
                    message=get_message_for_admin_or_manager(prev_inst, instance),
                    content_object=instance
                )
    if get_message_for_manager_or_developer(prev_inst, instance) is not None:
        admin = User.objects.filter_admins().first()
        Notification.objects.create(
            notify_to=instance.requester,
            creator=admin,
            message=get_message_for_manager_or_developer(prev_inst, instance),
            content_object=instance
        )

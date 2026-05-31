from django.db.models import QuerySet
from utils.models import SoftDeleteManager, SoftDeleteQuerySet
from .constants import (
    PROJECT_STATUS_ONGOING,
    FINANCIAL_STATUS_PENDING,
    FINANCIAL_STATUS_APPROVED,
    FINANCIAL_TYPE_RCV_PAYMENT,
    FINANCIAL_STATUS_DECLINED
)
from utils.helpers import get_dates_from_period


class ProjectQuerySet(QuerySet):
    def ongoing_projects(self):
        return self.filter(status=PROJECT_STATUS_ONGOING)

    def filter_by_user(self, user):
        if user.is_anonymous:
            return self.none()
        elif user.is_superuser:
            return self
        elif user.is_admin:
            return self.filter(project_starter__team__in=user.teams)
        elif user.is_developer:
            return self.filter(project_starter=user)
        elif user.is_team_manager:
            return self.filter(project_starter__in=user.team_members)


class FinancialRequestQuerySet(QuerySet):
    def pending_requests(self):
        return self.filter(status=FINANCIAL_STATUS_PENDING)
    
    def approved_requests(self):
        return self.filter(status=FINANCIAL_STATUS_APPROVED)
        
    def declined_requests(self):
        return self.filter(status=FINANCIAL_STATUS_DECLINED)

    def filter_by_user(self, user):
        if user.is_anonymous:
            return self.none()
        elif user.is_superuser:
            return self
        elif user.is_admin:
            return self.filter(requester__team__in=user.teams)
        elif user.is_developer:
            return self.filter(requester=user)
        elif user.is_team_manager:
            return self.filter(requester__in=user.team_members)


class TransactionQuerySet(QuerySet):
    def filter_by_period(self, query_params, **kwargs):
        period = query_params.get('period')
        dates = get_dates_from_period(period)
        if dates is not None:
            start_date = dates.get('start_date')
            end_date = dates.get('end_date')
        elif period == 'custom':
            default_dates = get_dates_from_period('this-month')
            start_date = query_params.get('from') or default_dates.get('start_date')
            end_date = query_params.get('to') or default_dates.get('end_date')
        else:
            return self

        return self.filter(created_at__gte=start_date, created_at__lte=end_date)

    def filter_by_user(self, user):
        if user.is_anonymous:
            return self.none()
        elif user.is_superuser:
            return self
        elif user.is_admin:
            return self.filter(owner__team__in=user.teams)
        elif user.is_developer:
            return self.filter(owner=user)
        elif user.is_team_manager:
            return self.filter(owner__in=user.team_members)


class PartnerQuerySet(SoftDeleteQuerySet):
    def filter_by_user(self, user):
        if user.is_anonymous:
            return self.none()
        elif user.is_superuser:
            return self
        elif user.is_admin:
            return self.filter(owner__team__in=user.teams)
        elif user.is_developer:
            return self.filter(owner=user)
        elif user.is_team_manager:
            return self.filter(owner__in=user.team_members)


class PartnerManager(SoftDeleteManager):
    def get_queryset(self):
        return PartnerQuerySet(self.model, using=self._db).alive()
    

class ClientQuerySet(QuerySet):
    def filter_by_user(self, user):
        if user.is_anonymous:
            return self.none()
        elif user.is_superuser:
            return self
        elif user.is_admin:
            return self.filter(owner__team__in=user.teams)
        elif user.is_developer:
            return self.filter(owner=user)
        elif user.is_team_manager:
            return self.filter(owner__in=user.team_members)

from django.db import models
import datetime
from .constants import REPORTING_INTERVAL_DAILY, REPORTING_INTERVAL_WEEKLY, REPORTING_INTERVAL_MONTHLY

class LogQuerySet(models.QuerySet):
    def daily_logs_for_today(self):
        return self.filter(
            created_at=datetime.date.today(),
            interval=REPORTING_INTERVAL_DAILY
        )
    
    def daily_logs_for_date(self, date):
        return self.filter(
            created_at=date,
            interval=REPORTING_INTERVAL_DAILY
        )
    
    def daily_logs(self):
        return self.filter(interval=REPORTING_INTERVAL_DAILY)

    def daily_logs_for_today_for_team(self, team_manager):
        return self.filter(
            created_at=datetime.date.today(),
            owner__in=team_manager.team_members,
            interval=REPORTING_INTERVAL_DAILY
        )

    def daily_logs_for_date_for_team(self, date, team_manager):
        return self.filter(
            created_at=date,
            owner__in=team_manager.team_members,
            interval=REPORTING_INTERVAL_DAILY
        )

    def daily_logs_for_team(self, team_manager):
        return self.filter(
            owner__in=team_manager.team_members,
            interval=REPORTING_INTERVAL_DAILY
        )
    
    def monthly_logs_for_this_month(self):
        dt = datetime.datetime.now()
        this_month = datetime.date(dt.year, dt.month, 1)
        return self.filter(created_at=this_month, interval=REPORTING_INTERVAL_MONTHLY)
    
    def monthly_logs_for_month(self, year, month):
        month = datetime.date(year, month, 1)
        return self.filter(created_at=month, interval=REPORTING_INTERVAL_MONTHLY)

    def monthly_logs(self):
        return self.filter(interval=REPORTING_INTERVAL_MONTHLY)

    def monthly_logs_for_this_month_for_team(self, team_manager):
        dt = datetime.datetime.now()
        this_month = datetime.date(dt.year, dt.month, 1)
        return self.filter(
            created_at=this_month,
            owner__in=team_manager.team_members,
            interval=REPORTING_INTERVAL_MONTHLY
        )

    def monthly_logs_for_month_for_team(self, year, month, team_manager):
        month = datetime.date(year, month, 1)
        return self.filter(
            created_at=month,
            owner__in=team_manager.team_members,
            interval=REPORTING_INTERVAL_MONTHLY
        )

    def monthly_logs_for_team(self, team_manager):
        return self.filter(
            owner__in=team_manager.team_members,
            interval=REPORTING_INTERVAL_MONTHLY
        )
    
    def weekly_logs_for_thisweek(self):
        dt = datetime.date.today()
        week = int(dt.strftime('%U'))
        return self.filter(
            created_at__year=dt.year,
            created_at__week=week,
            interval=REPORTING_INTERVAL_WEEKLY
        )

    def weekly_logs_for_week(self, year, week):
        return self.filter(
            created_at__year=year,
            created_at__week=week,
            interval=REPORTING_INTERVAL_WEEKLY
        )

    def weekly_logs_weekly_logs_for_thisweek_for_team(self, team_manager):
        dt = datetime.datetime.now()
        week = int(dt.strftime('%w'))
        return self.filter(
            created_at__year=dt.year,
            created_at__week=week,
            interval=REPORTING_INTERVAL_WEEKLY,
            owner__in=team_manager.team_members
        )
    
    def weekly_logs_for_week_for_team(self,year, week, team_manager):
        return self.filter(
            created_at__year=year,
            created_at__week=week,
            interval=REPORTING_INTERVAL_WEEKLY,
            owner__in=team_manager.team_members
        )
    def weekly_logs(self):
        return self.filter(interval=REPORTING_INTERVAL_WEEKLY)
    
    def weekly_logs_for_team(self, team_manager):
        return self.filter(
            owner__in=team_manager.team_members,
            interval=REPORTING_INTERVAL_WEEKLY
        )

    def my_daily_log_for_certain_date(self, owner, date):
        return self.filter(
            created_at=date,
            interval=REPORTING_INTERVAL_DAILY,
            owner=owner
        )
    
    def my_weekly_log_for_certain_week(self, owner, year, week):
        return self.filter(
            created_at__year=year,
            created_at__week=week,
            interval=REPORTING_INTERVAL_WEEKLY,
            owner=owner
        )

    
    def my_monthly_log_for_certain_month(self, owner, date):
        return self.filter(
            created_at=date, 
            interval=REPORTING_INTERVAL_MONTHLY,
            owner=owner
        )

    def filter_by_user(self, user):
        if user.is_superuser:
            return self
        return self.filter(owner__team__in=user.teams)

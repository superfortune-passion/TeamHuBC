import pandas as pd
import datetime
from django.db.models import Sum, Q

from finance.models import Project, FinancialRequest, Transaction
from finance import constants as cs
from api.common.report.constants import PERIOD_CUSTOM
from utils.helpers import get_dates_from_period
from finance.constants import FINANCIAL_TYPES_DICT


def get_ongoing_projects(viewer, team, user):
    if viewer.is_anonymous:
        return Project.objects.none()
    if user is not None:
        if viewer.is_admin and viewer.teams.filter(pk=user.team.pk).exists() or \
            viewer.is_team_manager and viewer.team_members.filter(pk=user.pk).exists():
            return user.projects.ongoing_projects()
        elif viewer.is_developer:
            return viewer.projects.ongoing_projects()
        else:
            return Project.objects.none()
    if team is not None and viewer.is_admin:
        return Project.objects.ongoing_projects().filter(participants__in=team.user_set.all())
    return Project.objects.filter_by_user(viewer).ongoing_projects()


def get_incomes_of_period(viewer, team, user, start, end ):
    """
    calculate incomes of given period according to start and end date
    """
    queryset = get_ongoing_projects(viewer, team, user)
    period_index = pd.date_range(start, end)
    income_series = pd.Series(0, index=period_index)
    for item in queryset:
        start_date = max(start, item.started_at)
        end_date = min(end, item.ended_at) if item.ended_at is not None else end
        if item.type == cs.PROJECT_TYPE_BUDGET:
            if item.ended_at <= end and item.ended_at >= start:
                start_date = item.ended_at
            else:
                continue
            proj_date_index = pd.date_range(start_date, end_date)
            working_hours_series = pd.Series(1, index=proj_date_index)     
            working_rate_series = pd.Series(item.price, index=proj_date_index)
            income_series = income_series.add(working_hours_series * working_rate_series, fill_value=0)
        elif item.type == cs.PROJECT_TYPE_CONTRACT:
            weekly_amount = 0
            proj_week_index = pd.period_range(start_date + datetime.timedelta(days=7), end_date, freq='W-SAT')
            working_weeks_series = pd.Series(1, index=proj_week_index)
            if item.payment_period == cs.WEEKLY:
                weekly_amount = item.price
            elif item.payment_period == cs.BI_WEEKLY:
                weekly_amount = item.price / 2
            else:
                weekly_amount = item.price / 4
            working_rate_series = pd.Series(weekly_amount, index=proj_week_index)
            income_series = income_series.add(working_weeks_series * working_rate_series, fill_value=0)
        else:
            proj_date_index = pd.bdate_range(start_date, end_date, freq='B')
            working_hours_series = pd.Series((item.weekly_limit or 0) / 5, index=proj_date_index) 
            working_rate_series = pd.Series(item.price, index=proj_date_index)
            income_series = income_series.add(working_hours_series * working_rate_series, fill_value=0)
    return income_series


def get_pending_financial_requests(viewer, team, user):
    if viewer.is_anonymous:
        return FinancialRequest.objects.none()
    if user is not None:
        if viewer.is_admin and viewer.teams.filter(pk=user.team.pk).exists() or \
            viewer.is_team_manager and viewer.team_members.filter(pk=user.pk).exists():
            return user.financialrequest_set.pending_requests()
        elif viewer.is_developer:
            return viewer.financialrequest_set.pending_requests()
        else:
            return FinancialRequest.objects.none()
    if team is not None and viewer.is_admin:
        return FinancialRequest.objects.pending_requests().filter(requester__in=team.user_set.all())
    return FinancialRequest.objects.filter_by_user(viewer).pending_requests()


def get_weekly_income(viewer, team, user, period):
    dates = get_dates_from_period(period)
    start_date = dates.get('start_date')
    end_date = dates.get('end_date')
    return get_incomes_of_period(viewer, team, user, start_date, end_date)


def get_expectations(viewer,team, user, period):
    """
    calculate incomes of this month expectation
    """
    dates = get_dates_from_period(period)
    start_date = dates.get('start_date')
    end_date = dates.get('end_date')
    return get_incomes_of_period(viewer, team, user, start_date, end_date).sum()


def get_queryset_with_developer_earnings(queryset, query_params):
    period = query_params.get('period')
    dates = get_dates_from_period(period)
    
    if dates is not None:
        start_date = dates.get('start_date')
        end_date = dates.get('end_date')
    else:
        default_dates = get_dates_from_period('this-month')
        start_date = query_params.get('from') or default_dates.get('start_date')
        end_date = query_params.get('to') or default_dates.get('end_date')

    return queryset.annotate(
        total=Sum('transaction__net_amount',
        filter=Q(
            transaction__created_at__gte=start_date,
            transaction__created_at__lte=end_date,
            # type__in=[
            #     cs.FINANCIAL_TYPE_RCV_PAYMENT,
            #     cs.FINANCIAL_TYPE_REFUND_PAYMENT
            # ]
        )))


def get_queryset_with_team_earnings(queryset, query_params):
    period = query_params.get('period')

    if period is not None and period != PERIOD_CUSTOM:
        dates = get_dates_from_period(period)
        start_date = dates.get('start_date')
        end_date = dates.get('end_date')
    else:
        start_date = query_params.get('from')
        end_date = query_params.get('to')

    return queryset.annotate(
        total=Sum('user__financialrequest__transaction__net_amount',
        filter=Q(
            user__financialrequest__transaction__created_at__gte=start_date,
            user__financialrequest__transaction__created_at__lte=end_date,
            user__financialrequest__type__in=[
                cs.FINANCIAL_TYPE_RCV_PAYMENT,
                cs.FINANCIAL_TYPE_REFUND_PAYMENT
            ]
        )))
    

def get_earnings(viewer, team=None, user=None, period=None, start_date=None, end_date=None):
    """
    calculate current earning of month as a developer or team-manger or developer
    """
    if period is not None and period!= PERIOD_CUSTOM:
        dates = get_dates_from_period(period)
        start_date = dates.get('start_date')
        end_date = dates.get('end_date')

    if viewer.is_anonymous:
        qs = Transaction.objects.none()
    elif user is not None:
        if viewer.is_admin and viewer.teams.filter(pk=user.team.pk).exists() or \
            viewer.is_team_manager and viewer.team_members.filter(pk=user.pk).exists():
            qs = user.transaction_set.all()
        elif viewer.is_developer:
            qs = viewer.transaction_set.all()
        else:
            qs = Transaction.objects.none()
    elif team is not None and viewer.is_admin:
        qs = Transaction.objects.filter(owner__in=team.user_set.all())
    else:
        qs = Transaction.objects.filter_by_user(viewer)

    sum = qs.filter(
        created_at__gte=start_date,
        created_at__lte=end_date,
    ) \
    .aggregate(Sum('net_amount'))
    return sum['net_amount__sum'] or 0


def get_approved_financial_requests(viewer, team, user):
    """
    report approved financial requests
    """
    if viewer.is_anonymous:
        queryset = FinancialRequest.objects.none()
    elif viewer.is_admin:
        if user is not None:
            queryset = user.financialrequest_set.approved_requests()
        elif team is not None:
            queryset = FinancialRequest.objects.approved_requests().filter(
                requester__in=team.user_set.all()
            )
        else:
            queryset = FinancialRequest.objects.approved_requests()
    elif viewer.is_team_manager:
        if user is not None:
            queryset = user.financialrequest_set.approved_requests()
        else:
            queryset = FinancialRequest.objects.approved_requests().filter(
                requester__in=viewer.team_members
            )
    else:
        queryset = viewer.financialrequest_set.approved_requests()
    return queryset


def get_user_project_earnings(user, period=None, start_date=None, end_date=None):
    """
    calculate current earning of developer by projects
    """
    if start_date is None and end_date is None:
        dates = get_dates_from_period(period)
        start_date = dates.get('start_date')
        end_date = dates.get('end_date')

    my_projects = Project.objects.filter(project_starter=user)
    project_count = my_projects.count()
    project_earning = list(range(project_count))

    for index in range(project_count):
        project = my_projects[index]
        sum = Transaction.objects \
            .filter(
                created_at__gte=start_date,
                created_at__lte=end_date,
                financial_request__project=project,
                financial_request__requester=user,
                financial_request__type__in=[
                    cs.FINANCIAL_TYPE_RCV_PAYMENT,
                    cs.FINANCIAL_TYPE_REFUND_PAYMENT
                ]
            ) \
            .aggregate(Sum('net_amount'))
        project_earning[index] = {
            'id': project.id,
            'project_title': project.title,
            'earning': sum['net_amount__sum'] or 0
        }

    return project_earning


def get_queryset_with_project_earnings( queryset, query_params):
    period = query_params.get('period')

    if period is not None and period != PERIOD_CUSTOM:
        dates = get_dates_from_period(period)
        start_date = dates.get('start_date')
        end_date = dates.get('end_date')
    else:
        start_date = query_params.get('from')
        end_date = query_params.get('to')
    return queryset.annotate(
        earning=Sum('financialrequest__transaction__net_amount',
        filter=Q(
            financialrequest__transaction__created_at__gte=start_date,
            financialrequest__transaction__created_at__lte=end_date,
            financialrequest__type__in=[
                cs.FINANCIAL_TYPE_RCV_PAYMENT,
                cs.FINANCIAL_TYPE_REFUND_PAYMENT
            ]
        )))


def get_report_developer_data_frame(user_earningset):
    df = pd.DataFrame({
        'Name': [user.full_name for user in user_earningset],
        'Earning': [user.total or 0 for user in user_earningset]
    })
    return df


def get_report_project_data_frame(project_earningset):
    df = pd.DataFrame({
        'Project Title': [project.title for project in project_earningset],
        'Earning': [project.earning or 0 for project in project_earningset]
    })
    return df


def get_report_team_data_frame(team_earningset):
    df = pd.DataFrame({
        'Name': [team.name for team in team_earningset],
        'Earning': [team.total or 0 for team in team_earningset]
    })
    return df


def get_transaction_data_frame(transaction_queryset):
    df = pd.DataFrame({
        "Date": [transaction.created_at for transaction in transaction_queryset],
        "Requested By": ['{} {}'.format(
            transaction.financial_request.requester.first_name,
            transaction.financial_request.requester.last_name
        ) for transaction in transaction_queryset],
        "Transaction Type": [FINANCIAL_TYPES_DICT[transaction.financial_request.type] for transaction in transaction_queryset],
        "Gross Amount": [transaction.gross_amount for transaction in transaction_queryset],
        "Net Amount": [transaction.net_amount for transaction in transaction_queryset],
        "Requested Amount": [transaction.financial_request.amount for transaction in transaction_queryset],
        "Pay to": [transaction.financial_request.address for transaction in transaction_queryset],
        "Description": [transaction.financial_request.description for transaction in transaction_queryset],
        "Payment Account": ['{} ({}) - {}'.format(
            Transaction.payment_account.display_name,
            Transaction.payment_account.address,
            Transaction.payment_account.platform 
        ) for Transaction in transaction_queryset],
    })
    return df

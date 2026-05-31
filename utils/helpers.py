import pandas as pd
from datetime import date, timedelta

from api.common.report.constants import REVIEW_WEEKDAY


def get_review_end_date_of_month(month_last_dt):
    last_dt_weekday = month_last_dt.weekday()
    if last_dt_weekday >= REVIEW_WEEKDAY:
        return month_last_dt - timedelta(days=last_dt_weekday) + timedelta(days=REVIEW_WEEKDAY)
    else:
        return month_last_dt - timedelta(days=last_dt_weekday + (7 - REVIEW_WEEKDAY))


def get_review_start_date_of_month(month_first_dt):
    first_dt_weekday = month_first_dt.weekday()
    if first_dt_weekday >= REVIEW_WEEKDAY + 1:
        return month_first_dt - timedelta(days=first_dt_weekday) + timedelta(days=REVIEW_WEEKDAY+1)
    else:
        return month_first_dt - timedelta(days=first_dt_weekday + (6 - REVIEW_WEEKDAY))


def get_dates_from_period(period):
    if period == 'this-month':
        # first_day_of_this_month = (date.today() - pd.tseries.offsets.MonthEnd(1)).date().replace(day=26)
        # last_day_of_this_month = (date.today() + pd.tseries.offsets.MonthEnd(0)).date().replace(day=25)
        # start_date = get_review_start_date_of_month(first_day_of_this_month)
        # end_date = get_review_end_date_of_month(last_day_of_this_month)
        start_date = (date.today() - pd.tseries.offsets.MonthEnd(1)).date().replace(day=26)
        end_date = (date.today() + pd.tseries.offsets.MonthEnd(0)).date().replace(day=25)
    elif period == 'this-quarter':
        # first_day_of_this_quarter = (date.today() - pd.tseries.offsets.QuarterEnd(1)).date() + timedelta(days=1)
        # last_day_of_this_quarter = (date.today() + pd.tseries.offsets.QuarterEnd(0)).date()
        # start_date = get_review_start_date_of_month(first_day_of_this_quarter)
        # end_date = get_review_end_date_of_month(last_day_of_this_quarter)
        start_date = (date.today() - pd.tseries.offsets.QuarterEnd(1)).date().replace(day=26)
        end_date = (date.today() + pd.tseries.offsets.QuarterEnd(0)).date().replace(day=25)
    elif period == 'this-week':
        today = date.today()
        week_of_today = today.weekday()
        start_date = today - timedelta(days=week_of_today)
        end_date = today + timedelta(days=6-week_of_today)
    else: return None
    return { 'start_date': start_date, 'end_date': end_date }

from django.apps import AppConfig


class ReportingConfig(AppConfig):
    name = 'reporting'

    def ready(self):
        from . import signal_receivers
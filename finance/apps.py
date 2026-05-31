from django.apps import AppConfig


class FinanceConfig(AppConfig):
    name = 'finance'
    
    def ready(self):
        from . import signal_receivers
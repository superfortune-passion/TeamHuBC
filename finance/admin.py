from django.contrib import admin
from .models import Client, Project, FinancialRequest, Partner, Transaction, PaymentAccount

class ClientModelAdmin(admin.ModelAdmin):
    list_display = ('id','type', 'full_name', 'company_name', 'started_at', 'owner')


class ProjectModelAdmin(admin.ModelAdmin):
    list_display = ('id','title', 'type', 'client', 'price', 'started_at', 'ended_at', 'status')


class FinancialRequestModelAdmin(admin.ModelAdmin):
    list_display = ('id','type', 'status', 'amount', 'address', 'requester', 'payment_account', 'requested_at')


class TransactionModelAdmin(admin.ModelAdmin):
    list_display = ('id','created_at', 'gross_amount', 'net_amount', 'payment_account', 'financial_request')


class PartnerModelAdmin(admin.ModelAdmin):
    list_display = ('id','full_name', 'email', 'owner')

class PaymentAccountModelAdmin(admin.ModelAdmin):
    list_display = ('id', 'platform','address', 'display_name', 'description')

admin.site.register(Client, ClientModelAdmin)
admin.site.register(Project, ProjectModelAdmin)
admin.site.register(FinancialRequest, FinancialRequestModelAdmin)
admin.site.register(Partner, PartnerModelAdmin)
admin.site.register(Transaction, TransactionModelAdmin)
admin.site.register(PaymentAccount, PaymentAccountModelAdmin)

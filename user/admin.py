from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import Group

from .models import User, Profile, Account, AccountSecurityQA, Team, AccountPlatform

class MyCustomUserAdmin(UserAdmin):
    list_display = ('username', 'email', 'first_name', 'last_name', 'role', 'team')
    fieldsets = UserAdmin.fieldsets + (
        (None, {'fields': ('role','team')}),
    )
    add_fieldsets = (
        (None, {'fields': ('team', 'username', 'password1', 'password2')}),
        ('Personal info', {'fields': ('first_name', 'last_name', 'email')}),
        ('Role', {
            'fields': ('role',),
        }),
    )

class AccountPlatformModelAdmin(admin.ModelAdmin):
    list_display = ('id', 'name')

admin.site.register(User, MyCustomUserAdmin)
admin.site.register(Profile)
admin.site.register(Account)
admin.site.register(AccountSecurityQA)
admin.site.register(Team)
admin.site.register(AccountPlatform, AccountPlatformModelAdmin)
admin.site.unregister(Group)
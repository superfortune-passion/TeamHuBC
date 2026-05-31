from django.contrib import admin
from .models import Log


class LogModelAdmin(admin.ModelAdmin):
  list_display = ('id', 'owner', 'plan', 'achievements', 'created_at', 'updated_at', 'interval')

admin.site.register(Log, LogModelAdmin)


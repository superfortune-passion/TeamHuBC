from django.urls import  include, path


urlpatterns = [
    path('auth/', include('api.auth.urls')),
    path('admin/', include('api.admin.urls')),
    path('team-manager/', include('api.team_manager.urls')),
    path('developer/', include('api.developer.urls')),
    path('search/', include('api.search.urls'))
]

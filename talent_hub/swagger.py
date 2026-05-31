from drf_yasg.views import get_schema_view
from drf_yasg import openapi


schema_view = get_schema_view(
   openapi.Info(
      title="Talents Hub API",
      default_version='v1',
      description="Talents Hub API Documentation",
      contact=openapi.Contact(email="ney9883@gmail.com"),
      license=openapi.License(name="BSD License"),
   ),
   public=True,
)

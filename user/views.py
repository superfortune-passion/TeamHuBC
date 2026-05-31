from rest_framework import viewsets

from .models import AccountPlatform
from .serializer import AccountPlatformSerializer
from api.permission import IsAdmin

class AccountPlatformViewSets(viewsets.ModelViewSet):
    permission_classes = [IsAdmin]
    queryset = AccountPlatform.objects.all()
    serializer_class = AccountPlatformSerializer

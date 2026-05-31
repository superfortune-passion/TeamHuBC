from rest_framework.generics import  RetrieveUpdateAPIView, ListAPIView

from ...common.serializers import TeamSerializer
from .serializers import TeamUserListSerializer
from api.permission import IsTeamManager, IsAdminOrManager
from user.models import User, Team


class TeamView(RetrieveUpdateAPIView):
    permission_classes = [IsAdminOrManager]
    serializer_class = TeamSerializer
    queryset = Team.objects.all()

    def get_object(self):
        return self.request.user.team


class TeamUserListView(ListAPIView):
    serializer_class = TeamUserListSerializer
    permission_classes = [IsTeamManager]
    
    def get_queryset(self):
        return self.request.user.team_members


# team-manager/users/:id/profiles (LIST)
# class TeamProfilesByUser(ListAPIView):
#     serializer_class = ProfileSerializer

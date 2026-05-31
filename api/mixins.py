from django.http import Http404
from rest_framework.decorators import action
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response
from rest_framework import status
from django.db import models


class FilterByUserQsMixin:
    def get_queryset(self):
        return self.queryset.filter_by_user(self.request.user)


class SoftDeleteMixin:
    def get_object(self, include_deleted=False):
        pk = self.kwargs.get('pk')
        if include_deleted == False:
            return super.get_object()
        else:
            try:
                return self.all_queryset.get(pk=pk)  # Allow soft-deleted products
            except models.Model.DoesNotExist:
                raise Http404

    @action(detail=False, methods=['get'], url_path='deleted')
    def deleted_items(self, request):
        # Paginate the queryset
        Paginator = self.pagination_class or PageNumberPagination
        paginator = Paginator()
        paginated_items = paginator.paginate_queryset(self.all_queryset.deleted(), request)

        # Serialize the paginated data
        MySerializer = self.get_serializer_class()
        serializer = MySerializer(paginated_items, many=True)
        # Return the paginated response
        return paginator.get_paginated_response(serializer.data)

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object(include_deleted=True)
        if instance.is_alive():
            instance.delete()
            return Response(
                {'detail': 'Soft-deleted successfully.'},
                status=status.HTTP_204_NO_CONTENT
            )
        else:
            instance.hard_delete()
            return Response(
                {'detail': 'Permanently deleted successfully.'},
                status=status.HTTP_204_NO_CONTENT
            )

    @action(detail=True, methods=['put'], url_path='restore')
    def restore(self, request, *args, **kwargs):
        instance = self.get_object(include_deleted=True)
        print(instance)
        instance.restore()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)

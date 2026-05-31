from rest_framework import serializers
from django.contrib.contenttypes.models import ContentType
from finance.models import Client, Partner, Project, FinancialRequest, Transaction, PaymentAccount
from django.db.models.functions import Abs

from ..user.serializers import UserSerializer
from finance import constants as cs
import datetime

class ClientDetailSerializer(serializers.ModelSerializer):
    owner = UserSerializer()

    class Meta:
        model = Client
        fields = ('id', 'type', 'full_name', 'company_name', 'started_at', 'owner')


class ClientUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Client
        fields = ('id', 'type', 'full_name', 'company_name', 'started_at', 'owner')


class PartnerSerializer(serializers.ModelSerializer):
    contact_method = serializers.JSONField()

    class Meta:
         model = Partner
         fields = ('id', 'full_name', 'email', 'address', 'dob', 'phone_num', 'contact_method', 'memo', 'owner')


class PartnerDetailSerializer(serializers.ModelSerializer):
    contact_method = serializers.JSONField()
    owner = UserSerializer()

    class Meta:
         model = Partner
         fields = ('id', 'full_name', 'email', 'address', 'dob', 'phone_num', 'contact_method', 'memo', 'owner')


class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Project
        fields = (
            'id', 
            'title',
            'type',
            'weekly_limit',
            'payment_period', 
            'price', 
            'client', 
            'participants', 
            'project_starter', 
            'started_at', 
            'ended_at', 
            'status'
        )


class ProjectListSerializer(serializers.ModelSerializer):
    project_starter = UserSerializer()

    class Meta:
        model = Project
        fields = (
            'id', 
            'title',
            'type',
            'weekly_limit', 
            'price', 
            'client', 
            'participants', 
            'project_starter', 
            'started_at', 
            'ended_at', 
            'status'
        )

class PaymentAccountSerializer(serializers.ModelSerializer):
    class Meta:
        model = PaymentAccount
        fields = (
            'id', 
            'platform',
            'address',
            'display_name',
            'description',
            'archived',
        )


# class CounterPartyRelatedField(serializers.RelatedField):
#     def to_representation(self, value):
#         if isinstance(value, Client):
#             serializer = ClientDetailSerializer(instance=value)
#         elif isinstance(value, Partner):
#             serializer = PartnerDetailSerializer(instance=value)
#         else:
#             raise Exception('Unexpected type of counter party')
    
#         return serializer.data


class FinancialRequestDetailSerializer(serializers.ModelSerializer):
    requester = UserSerializer(required=False)
    project = ProjectSerializer(required=False)
    payment_account = PaymentAccountSerializer(required=False)
    # counter_party = CounterPartyRelatedField(read_only=True)

    class Meta:
        model = FinancialRequest
        fields = ('id', 'type', 'status', 'amount', 'address', 'requested_at', 'requester', 'project', 'payment_account', 'description')


class FinancialRequestSerializer(serializers.ModelSerializer):
    def validate(self, data):
        data = super().validate(data)
        # if data['type'] in [cs.FINANCIAL_TYPE_SND_INVOICE, cs.FINANCIAL_TYPE_RCV_PAYMENT, cs.FINANCIAL_TYPE_REFUND_PAYMENT]:
        #     counter_party_type_id = ContentType.objects.get(app_label='finance', model='client').id
        # elif data['type'] == cs.FINANCIAL_TYPE_SND_PAYMENT:
        #     counter_party_type_id = ContentType.objects.get(app_label='finance', model='partner').id
        # counter_party_id = self.initial_data['counter_party']
        # data.update({'counter_party_type_id': counter_party_type_id, 'counter_party_id': counter_party_id})
        return data

    class Meta:
        model = FinancialRequest
        fields = ('id', 'type', 'status', 'amount', 'address', 'requested_at', 'payment_account', 'requester', 'project', 'description')
        read_only_fields = ('status', )


class TransactionDetailSerializer(serializers.ModelSerializer):
    financial_request = FinancialRequestDetailSerializer(required=False)
    payment_account = PaymentAccountSerializer(required=False)
    
    class Meta:
        model = Transaction
        fields = ('id', 'owner', 'project', 'address', 'gross_amount', 'net_amount', 'payment_account', 'description', 'created_at', 'financial_request')


class TransactionCreateSerializer(serializers.ModelSerializer):
    def validate_gross_amount(self, gross_amount):
        fr_pk = self.initial_data.get('financial_request', None)
        if fr_pk is not None:
            fr = FinancialRequest.objects.get(pk=fr_pk)
            if fr.type in [cs.FINANCIAL_TYPE_SND_PAYMENT, cs.FINANCIAL_TYPE_REFUND_PAYMENT]:
                return -Abs(gross_amount)
        return gross_amount

    def validate_net_amount(self, net_amount):
        fr_pk = self.initial_data.get('financial_request', None)
        if fr_pk is not None:
            fr = FinancialRequest.objects.get(pk=fr_pk)
            if fr.type in [cs.FINANCIAL_TYPE_SND_PAYMENT, cs.FINANCIAL_TYPE_REFUND_PAYMENT]:
                return -Abs(net_amount)
        return net_amount

    class Meta:
        model = Transaction
        fields = ('id', 'owner', 'project', 'address', 'gross_amount', 'net_amount', 'payment_account', 'description', 'created_at', 'financial_request')

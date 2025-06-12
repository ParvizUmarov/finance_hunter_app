// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_bank_account_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateBankAccountRequestBody _$UpdateBankAccountRequestBodyFromJson(
  Map<String, dynamic> json,
) => _UpdateBankAccountRequestBody(
  name: json['name'] as String,
  balance: json['balance'] as String,
  currency: json['currency'] as String,
);

Map<String, dynamic> _$UpdateBankAccountRequestBodyToJson(
  _UpdateBankAccountRequestBody instance,
) => <String, dynamic>{
  'name': instance.name,
  'balance': instance.balance,
  'currency': instance.currency,
};

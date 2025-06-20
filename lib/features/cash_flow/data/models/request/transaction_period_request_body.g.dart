// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_period_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionPeriodRequestBody _$TransactionPeriodRequestBodyFromJson(
  Map<String, dynamic> json,
) => _TransactionPeriodRequestBody(
  accountId: (json['accountId'] as num).toInt(),
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
);

Map<String, dynamic> _$TransactionPeriodRequestBodyToJson(
  _TransactionPeriodRequestBody instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'startDate': instance.startDate?.toIso8601String(),
  'endDate': instance.endDate?.toIso8601String(),
};

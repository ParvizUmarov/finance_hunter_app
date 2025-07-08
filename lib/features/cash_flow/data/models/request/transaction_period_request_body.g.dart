// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_period_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionPeriodRequestBody _$TransactionPeriodRequestBodyFromJson(
  Map<String, dynamic> json,
) => _TransactionPeriodRequestBody(
  accountId: (json['accountId'] as num).toInt(),
  startDate: const DateOnlyConverter().fromJson(json['startDate'] as String?),
  endDate: const DateOnlyConverter().fromJson(json['endDate'] as String?),
);

Map<String, dynamic> _$TransactionPeriodRequestBodyToJson(
  _TransactionPeriodRequestBody instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'startDate': const DateOnlyConverter().toJson(instance.startDate),
  'endDate': const DateOnlyConverter().toJson(instance.endDate),
};

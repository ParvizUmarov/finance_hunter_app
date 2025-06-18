import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_period_request_body.freezed.dart';

part 'transaction_period_request_body.g.dart';

@freezed
abstract class TransactionPeriodRequestBody
    with _$TransactionPeriodRequestBody {
  const factory TransactionPeriodRequestBody({
    required int accountId,
    DateTime? startDate,
    DateTime? endDate,
  }) = _TransactionPeriodRequestBody;

  factory TransactionPeriodRequestBody.fromJson(Map<String, dynamic> json) =>
      _$TransactionPeriodRequestBodyFromJson(json);
}

import 'package:finance_hunter_app/core/utils/date_only_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_period_request_body.freezed.dart';

part 'transaction_period_request_body.g.dart';

@freezed
abstract class TransactionPeriodRequestBody
    with _$TransactionPeriodRequestBody {
  const factory TransactionPeriodRequestBody({
    required int accountId,
    @DateOnlyConverter() DateTime? startDate,
    @DateOnlyConverter() DateTime? endDate,
  }) = _TransactionPeriodRequestBody;

  factory TransactionPeriodRequestBody.fromJson(Map<String, dynamic> json) =>
      _$TransactionPeriodRequestBodyFromJson(json);
}

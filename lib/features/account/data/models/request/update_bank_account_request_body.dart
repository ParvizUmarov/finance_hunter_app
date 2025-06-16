
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_bank_account_request_body.freezed.dart';
part 'update_bank_account_request_body.g.dart';

@freezed
abstract class UpdateBankAccountRequestBody with _$UpdateBankAccountRequestBody {
  const factory UpdateBankAccountRequestBody({
    required String name,
    required String balance,
    required String currency
  }) = _UpdateBankAccountRequestBody;

  factory UpdateBankAccountRequestBody.fromJson(Map<String, dynamic> json) =>
      _$UpdateBankAccountRequestBodyFromJson(json);
}
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_request_body.freezed.dart';
part 'transaction_request_body.g.dart';

@freezed
abstract class TransactionRequestBody with _$TransactionRequestBody {

  const factory TransactionRequestBody({
    required int accountId,
    required int categoryId,
    required String amount,
    required DateTime transactionDate,
    required String comment,
  }) = _TransactionRequestBody;

  factory TransactionRequestBody.fromJson(Map<String, dynamic> json) =>
      _$TransactionRequestBodyFromJson(json);

}
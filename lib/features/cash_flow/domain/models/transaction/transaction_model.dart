import 'package:finance_hunter_app/features/account/domain/domain.dart';
import 'package:finance_hunter_app/features/articles/domain/models/category_model.dart';
import 'package:finance_hunter_app/features/cash_flow/data/models/request/transaction_request_body.dart';
import 'package:finance_hunter_app/features/cash_flow/data/models/response/transaction_response_model.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/models/transaction/account_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';

part 'transaction_model.g.dart';

@freezed
abstract class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required int id,
    @JsonKey(includeFromJson: false, includeToJson: false) int? localId,
    required AccountModel account,
    required CategoryModel category,
    required String amount,
    required DateTime transactionDate,
    String? comment,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}

extension TransactionModelX on TransactionModel {
  TransactionRequestBody toRequestBody() {
    return TransactionRequestBody(
      accountId: account.id,
      categoryId: category.id,
      amount: amount,
      transactionDate: transactionDate,
      comment: comment,
    );
  }
}

extension TransactionResponseModelX on TransactionModel {
  TransactionResponseModel toResponseModel() {
    return TransactionResponseModel(
      id: id,
      accountId: account.id,
      categoryId: category.id,
      amount: amount,
      transactionDate: transactionDate,
      comment: comment ?? "",
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

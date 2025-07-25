import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_response_model.freezed.dart';
part 'transaction_response_model.g.dart';

@freezed
abstract class TransactionResponseModel with _$TransactionResponseModel {

  const factory TransactionResponseModel({
    required int id,
    required int accountId,
    required int categoryId,
    required String amount,
    required DateTime transactionDate,
    required String? comment,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TransactionResponseModel;

  factory TransactionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseModelFromJson(json);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionResponseModel &&
        other.id == id &&
        other.accountId == accountId &&
        other.categoryId == categoryId &&
        other.amount == amount &&
        other.transactionDate == transactionDate &&
        other.comment == comment &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    accountId.hashCode ^
    categoryId.hashCode ^
    amount.hashCode ^
    transactionDate.hashCode ^
    comment.hashCode ^
    createdAt.hashCode ^
    updatedAt.hashCode;
  }

}
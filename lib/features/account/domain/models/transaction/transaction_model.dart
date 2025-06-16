import 'package:finance_hunter_app/features/categories/domain/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'account_model.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
abstract class TransactionModel with _$TransactionModel {

  const factory TransactionModel({
    required int id,
    required AccountModel account,
    required CategoryModel category,
    required String amount,
    required DateTime transactionDate,
    required String comment,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}
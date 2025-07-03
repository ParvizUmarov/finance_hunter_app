import 'package:finance_hunter_app/features/articles/domain/models/category_model.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/models/transaction/transaction_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'grouped_transaction_model.freezed.dart';

part 'grouped_transaction_model.g.dart';

@freezed
abstract class GroupedTransactionModel with _$GroupedTransactionModel {

  const factory GroupedTransactionModel({
    required int id,
    required String amount,
    required String emoji,
    required String percent,
    required String title,
    required String? description,
    required CategoryModel category,
    required List<TransactionModel> transactions,

  }) = _GroupedTransactionModel;

  factory GroupedTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$GroupedTransactionModelFromJson(json);
}


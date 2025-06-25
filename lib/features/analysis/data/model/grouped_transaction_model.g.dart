// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grouped_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GroupedTransactionModel _$GroupedTransactionModelFromJson(
  Map<String, dynamic> json,
) => _GroupedTransactionModel(
  id: (json['id'] as num).toInt(),
  amount: json['amount'] as String,
  emoji: json['emoji'] as String,
  percent: json['percent'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  category: CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
  transactions: (json['transactions'] as List<dynamic>)
      .map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GroupedTransactionModelToJson(
  _GroupedTransactionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'amount': instance.amount,
  'emoji': instance.emoji,
  'percent': instance.percent,
  'title': instance.title,
  'description': instance.description,
  'category': instance.category,
  'transactions': instance.transactions,
};

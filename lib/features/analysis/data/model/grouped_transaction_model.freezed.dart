// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grouped_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroupedTransactionModel {

 int get id; String get amount; String get emoji; String get percent; String get title; String? get description; CategoryModel get category; List<TransactionModel> get transactions;
/// Create a copy of GroupedTransactionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupedTransactionModelCopyWith<GroupedTransactionModel> get copyWith => _$GroupedTransactionModelCopyWithImpl<GroupedTransactionModel>(this as GroupedTransactionModel, _$identity);

  /// Serializes this GroupedTransactionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupedTransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.transactions, transactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,emoji,percent,title,description,category,const DeepCollectionEquality().hash(transactions));

@override
String toString() {
  return 'GroupedTransactionModel(id: $id, amount: $amount, emoji: $emoji, percent: $percent, title: $title, description: $description, category: $category, transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class $GroupedTransactionModelCopyWith<$Res>  {
  factory $GroupedTransactionModelCopyWith(GroupedTransactionModel value, $Res Function(GroupedTransactionModel) _then) = _$GroupedTransactionModelCopyWithImpl;
@useResult
$Res call({
 int id, String amount, String emoji, String percent, String title, String? description, CategoryModel category, List<TransactionModel> transactions
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$GroupedTransactionModelCopyWithImpl<$Res>
    implements $GroupedTransactionModelCopyWith<$Res> {
  _$GroupedTransactionModelCopyWithImpl(this._self, this._then);

  final GroupedTransactionModel _self;
  final $Res Function(GroupedTransactionModel) _then;

/// Create a copy of GroupedTransactionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amount = null,Object? emoji = null,Object? percent = null,Object? title = null,Object? description = freezed,Object? category = null,Object? transactions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,
  ));
}
/// Create a copy of GroupedTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _GroupedTransactionModel implements GroupedTransactionModel {
  const _GroupedTransactionModel({required this.id, required this.amount, required this.emoji, required this.percent, required this.title, required this.description, required this.category, required final  List<TransactionModel> transactions}): _transactions = transactions;
  factory _GroupedTransactionModel.fromJson(Map<String, dynamic> json) => _$GroupedTransactionModelFromJson(json);

@override final  int id;
@override final  String amount;
@override final  String emoji;
@override final  String percent;
@override final  String title;
@override final  String? description;
@override final  CategoryModel category;
 final  List<TransactionModel> _transactions;
@override List<TransactionModel> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}


/// Create a copy of GroupedTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupedTransactionModelCopyWith<_GroupedTransactionModel> get copyWith => __$GroupedTransactionModelCopyWithImpl<_GroupedTransactionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroupedTransactionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupedTransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._transactions, _transactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,emoji,percent,title,description,category,const DeepCollectionEquality().hash(_transactions));

@override
String toString() {
  return 'GroupedTransactionModel(id: $id, amount: $amount, emoji: $emoji, percent: $percent, title: $title, description: $description, category: $category, transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class _$GroupedTransactionModelCopyWith<$Res> implements $GroupedTransactionModelCopyWith<$Res> {
  factory _$GroupedTransactionModelCopyWith(_GroupedTransactionModel value, $Res Function(_GroupedTransactionModel) _then) = __$GroupedTransactionModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String amount, String emoji, String percent, String title, String? description, CategoryModel category, List<TransactionModel> transactions
});


@override $CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$GroupedTransactionModelCopyWithImpl<$Res>
    implements _$GroupedTransactionModelCopyWith<$Res> {
  __$GroupedTransactionModelCopyWithImpl(this._self, this._then);

  final _GroupedTransactionModel _self;
  final $Res Function(_GroupedTransactionModel) _then;

/// Create a copy of GroupedTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amount = null,Object? emoji = null,Object? percent = null,Object? title = null,Object? description = freezed,Object? category = null,Object? transactions = null,}) {
  return _then(_GroupedTransactionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,
  ));
}

/// Create a copy of GroupedTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionRequestBody {

 int get accountId; int get categoryId; String get amount; DateTime get transactionDate; String get comment;
/// Create a copy of TransactionRequestBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionRequestBodyCopyWith<TransactionRequestBody> get copyWith => _$TransactionRequestBodyCopyWithImpl<TransactionRequestBody>(this as TransactionRequestBody, _$identity);

  /// Serializes this TransactionRequestBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionRequestBody&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,categoryId,amount,transactionDate,comment);

@override
String toString() {
  return 'TransactionRequestBody(accountId: $accountId, categoryId: $categoryId, amount: $amount, transactionDate: $transactionDate, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $TransactionRequestBodyCopyWith<$Res>  {
  factory $TransactionRequestBodyCopyWith(TransactionRequestBody value, $Res Function(TransactionRequestBody) _then) = _$TransactionRequestBodyCopyWithImpl;
@useResult
$Res call({
 int accountId, int categoryId, String amount, DateTime transactionDate, String comment
});




}
/// @nodoc
class _$TransactionRequestBodyCopyWithImpl<$Res>
    implements $TransactionRequestBodyCopyWith<$Res> {
  _$TransactionRequestBodyCopyWithImpl(this._self, this._then);

  final TransactionRequestBody _self;
  final $Res Function(TransactionRequestBody) _then;

/// Create a copy of TransactionRequestBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,Object? categoryId = null,Object? amount = null,Object? transactionDate = null,Object? comment = null,}) {
  return _then(_self.copyWith(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TransactionRequestBody implements TransactionRequestBody {
  const _TransactionRequestBody({required this.accountId, required this.categoryId, required this.amount, required this.transactionDate, required this.comment});
  factory _TransactionRequestBody.fromJson(Map<String, dynamic> json) => _$TransactionRequestBodyFromJson(json);

@override final  int accountId;
@override final  int categoryId;
@override final  String amount;
@override final  DateTime transactionDate;
@override final  String comment;

/// Create a copy of TransactionRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionRequestBodyCopyWith<_TransactionRequestBody> get copyWith => __$TransactionRequestBodyCopyWithImpl<_TransactionRequestBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionRequestBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionRequestBody&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,categoryId,amount,transactionDate,comment);

@override
String toString() {
  return 'TransactionRequestBody(accountId: $accountId, categoryId: $categoryId, amount: $amount, transactionDate: $transactionDate, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$TransactionRequestBodyCopyWith<$Res> implements $TransactionRequestBodyCopyWith<$Res> {
  factory _$TransactionRequestBodyCopyWith(_TransactionRequestBody value, $Res Function(_TransactionRequestBody) _then) = __$TransactionRequestBodyCopyWithImpl;
@override @useResult
$Res call({
 int accountId, int categoryId, String amount, DateTime transactionDate, String comment
});




}
/// @nodoc
class __$TransactionRequestBodyCopyWithImpl<$Res>
    implements _$TransactionRequestBodyCopyWith<$Res> {
  __$TransactionRequestBodyCopyWithImpl(this._self, this._then);

  final _TransactionRequestBody _self;
  final $Res Function(_TransactionRequestBody) _then;

/// Create a copy of TransactionRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,Object? categoryId = null,Object? amount = null,Object? transactionDate = null,Object? comment = null,}) {
  return _then(_TransactionRequestBody(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

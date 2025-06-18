// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionState()';
}


}

/// @nodoc
class $TransactionStateCopyWith<$Res>  {
$TransactionStateCopyWith(TransactionState _, $Res Function(TransactionState) __);
}


/// @nodoc


class TransactionInitial implements TransactionState {
  const TransactionInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionState.initial()';
}


}




/// @nodoc


class TransactionLoading implements TransactionState {
  const TransactionLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionState.loading()';
}


}




/// @nodoc


class TransactionSuccess implements TransactionState {
  const TransactionSuccess({required final  List<TransactionModel> transactions, required this.totalAmount, required this.startDate, required this.endDate}): _transactions = transactions;
  

 final  List<TransactionModel> _transactions;
 List<TransactionModel> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

 final  String totalAmount;
 final  String startDate;
 final  String endDate;

/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionSuccessCopyWith<TransactionSuccess> get copyWith => _$TransactionSuccessCopyWithImpl<TransactionSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionSuccess&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_transactions),totalAmount,startDate,endDate);

@override
String toString() {
  return 'TransactionState.success(transactions: $transactions, totalAmount: $totalAmount, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $TransactionSuccessCopyWith<$Res> implements $TransactionStateCopyWith<$Res> {
  factory $TransactionSuccessCopyWith(TransactionSuccess value, $Res Function(TransactionSuccess) _then) = _$TransactionSuccessCopyWithImpl;
@useResult
$Res call({
 List<TransactionModel> transactions, String totalAmount, String startDate, String endDate
});




}
/// @nodoc
class _$TransactionSuccessCopyWithImpl<$Res>
    implements $TransactionSuccessCopyWith<$Res> {
  _$TransactionSuccessCopyWithImpl(this._self, this._then);

  final TransactionSuccess _self;
  final $Res Function(TransactionSuccess) _then;

/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? transactions = null,Object? totalAmount = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(TransactionSuccess(
transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TransactionError implements TransactionState {
  const TransactionError({required this.message});
  

 final  String message;

/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionErrorCopyWith<TransactionError> get copyWith => _$TransactionErrorCopyWithImpl<TransactionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TransactionState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TransactionErrorCopyWith<$Res> implements $TransactionStateCopyWith<$Res> {
  factory $TransactionErrorCopyWith(TransactionError value, $Res Function(TransactionError) _then) = _$TransactionErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TransactionErrorCopyWithImpl<$Res>
    implements $TransactionErrorCopyWith<$Res> {
  _$TransactionErrorCopyWithImpl(this._self, this._then);

  final TransactionError _self;
  final $Res Function(TransactionError) _then;

/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TransactionError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

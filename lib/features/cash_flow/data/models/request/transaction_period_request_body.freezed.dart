// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_period_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionPeriodRequestBody {

 int get accountId;@DateOnlyConverter() DateTime? get startDate;@DateOnlyConverter() DateTime? get endDate;
/// Create a copy of TransactionPeriodRequestBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionPeriodRequestBodyCopyWith<TransactionPeriodRequestBody> get copyWith => _$TransactionPeriodRequestBodyCopyWithImpl<TransactionPeriodRequestBody>(this as TransactionPeriodRequestBody, _$identity);

  /// Serializes this TransactionPeriodRequestBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionPeriodRequestBody&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,startDate,endDate);

@override
String toString() {
  return 'TransactionPeriodRequestBody(accountId: $accountId, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $TransactionPeriodRequestBodyCopyWith<$Res>  {
  factory $TransactionPeriodRequestBodyCopyWith(TransactionPeriodRequestBody value, $Res Function(TransactionPeriodRequestBody) _then) = _$TransactionPeriodRequestBodyCopyWithImpl;
@useResult
$Res call({
 int accountId,@DateOnlyConverter() DateTime? startDate,@DateOnlyConverter() DateTime? endDate
});




}
/// @nodoc
class _$TransactionPeriodRequestBodyCopyWithImpl<$Res>
    implements $TransactionPeriodRequestBodyCopyWith<$Res> {
  _$TransactionPeriodRequestBodyCopyWithImpl(this._self, this._then);

  final TransactionPeriodRequestBody _self;
  final $Res Function(TransactionPeriodRequestBody) _then;

/// Create a copy of TransactionPeriodRequestBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_self.copyWith(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TransactionPeriodRequestBody implements TransactionPeriodRequestBody {
  const _TransactionPeriodRequestBody({required this.accountId, @DateOnlyConverter() this.startDate, @DateOnlyConverter() this.endDate});
  factory _TransactionPeriodRequestBody.fromJson(Map<String, dynamic> json) => _$TransactionPeriodRequestBodyFromJson(json);

@override final  int accountId;
@override@DateOnlyConverter() final  DateTime? startDate;
@override@DateOnlyConverter() final  DateTime? endDate;

/// Create a copy of TransactionPeriodRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionPeriodRequestBodyCopyWith<_TransactionPeriodRequestBody> get copyWith => __$TransactionPeriodRequestBodyCopyWithImpl<_TransactionPeriodRequestBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionPeriodRequestBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionPeriodRequestBody&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,startDate,endDate);

@override
String toString() {
  return 'TransactionPeriodRequestBody(accountId: $accountId, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$TransactionPeriodRequestBodyCopyWith<$Res> implements $TransactionPeriodRequestBodyCopyWith<$Res> {
  factory _$TransactionPeriodRequestBodyCopyWith(_TransactionPeriodRequestBody value, $Res Function(_TransactionPeriodRequestBody) _then) = __$TransactionPeriodRequestBodyCopyWithImpl;
@override @useResult
$Res call({
 int accountId,@DateOnlyConverter() DateTime? startDate,@DateOnlyConverter() DateTime? endDate
});




}
/// @nodoc
class __$TransactionPeriodRequestBodyCopyWithImpl<$Res>
    implements _$TransactionPeriodRequestBodyCopyWith<$Res> {
  __$TransactionPeriodRequestBodyCopyWithImpl(this._self, this._then);

  final _TransactionPeriodRequestBody _self;
  final $Res Function(_TransactionPeriodRequestBody) _then;

/// Create a copy of TransactionPeriodRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_TransactionPeriodRequestBody(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on

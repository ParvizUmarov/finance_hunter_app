// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_bank_account_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateBankAccountRequestBody {

 String get name; String get balance; String get currency;
/// Create a copy of UpdateBankAccountRequestBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateBankAccountRequestBodyCopyWith<UpdateBankAccountRequestBody> get copyWith => _$UpdateBankAccountRequestBodyCopyWithImpl<UpdateBankAccountRequestBody>(this as UpdateBankAccountRequestBody, _$identity);

  /// Serializes this UpdateBankAccountRequestBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateBankAccountRequestBody&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,balance,currency);

@override
String toString() {
  return 'UpdateBankAccountRequestBody(name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $UpdateBankAccountRequestBodyCopyWith<$Res>  {
  factory $UpdateBankAccountRequestBodyCopyWith(UpdateBankAccountRequestBody value, $Res Function(UpdateBankAccountRequestBody) _then) = _$UpdateBankAccountRequestBodyCopyWithImpl;
@useResult
$Res call({
 String name, String balance, String currency
});




}
/// @nodoc
class _$UpdateBankAccountRequestBodyCopyWithImpl<$Res>
    implements $UpdateBankAccountRequestBodyCopyWith<$Res> {
  _$UpdateBankAccountRequestBodyCopyWithImpl(this._self, this._then);

  final UpdateBankAccountRequestBody _self;
  final $Res Function(UpdateBankAccountRequestBody) _then;

/// Create a copy of UpdateBankAccountRequestBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? balance = null,Object? currency = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UpdateBankAccountRequestBody implements UpdateBankAccountRequestBody {
  const _UpdateBankAccountRequestBody({required this.name, required this.balance, required this.currency});
  factory _UpdateBankAccountRequestBody.fromJson(Map<String, dynamic> json) => _$UpdateBankAccountRequestBodyFromJson(json);

@override final  String name;
@override final  String balance;
@override final  String currency;

/// Create a copy of UpdateBankAccountRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateBankAccountRequestBodyCopyWith<_UpdateBankAccountRequestBody> get copyWith => __$UpdateBankAccountRequestBodyCopyWithImpl<_UpdateBankAccountRequestBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateBankAccountRequestBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateBankAccountRequestBody&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,balance,currency);

@override
String toString() {
  return 'UpdateBankAccountRequestBody(name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$UpdateBankAccountRequestBodyCopyWith<$Res> implements $UpdateBankAccountRequestBodyCopyWith<$Res> {
  factory _$UpdateBankAccountRequestBodyCopyWith(_UpdateBankAccountRequestBody value, $Res Function(_UpdateBankAccountRequestBody) _then) = __$UpdateBankAccountRequestBodyCopyWithImpl;
@override @useResult
$Res call({
 String name, String balance, String currency
});




}
/// @nodoc
class __$UpdateBankAccountRequestBodyCopyWithImpl<$Res>
    implements _$UpdateBankAccountRequestBodyCopyWith<$Res> {
  __$UpdateBankAccountRequestBodyCopyWithImpl(this._self, this._then);

  final _UpdateBankAccountRequestBody _self;
  final $Res Function(_UpdateBankAccountRequestBody) _then;

/// Create a copy of UpdateBankAccountRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? balance = null,Object? currency = null,}) {
  return _then(_UpdateBankAccountRequestBody(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_form_fields.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OperationFormFields {

 AccountModel? get account; CategoryModel? get category; String get amount; DateTime get date; TimeOfDay get time; String get comment;
/// Create a copy of OperationFormFields
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperationFormFieldsCopyWith<OperationFormFields> get copyWith => _$OperationFormFieldsCopyWithImpl<OperationFormFields>(this as OperationFormFields, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationFormFields&&(identical(other.account, account) || other.account == account)&&(identical(other.category, category) || other.category == category)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,account,category,amount,date,time,comment);

@override
String toString() {
  return 'OperationFormFields(account: $account, category: $category, amount: $amount, date: $date, time: $time, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $OperationFormFieldsCopyWith<$Res>  {
  factory $OperationFormFieldsCopyWith(OperationFormFields value, $Res Function(OperationFormFields) _then) = _$OperationFormFieldsCopyWithImpl;
@useResult
$Res call({
 AccountModel? account, CategoryModel? category, String amount, DateTime date, TimeOfDay time, String comment
});


$AccountModelCopyWith<$Res>? get account;$CategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class _$OperationFormFieldsCopyWithImpl<$Res>
    implements $OperationFormFieldsCopyWith<$Res> {
  _$OperationFormFieldsCopyWithImpl(this._self, this._then);

  final OperationFormFields _self;
  final $Res Function(OperationFormFields) _then;

/// Create a copy of OperationFormFields
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? account = freezed,Object? category = freezed,Object? amount = null,Object? date = null,Object? time = null,Object? comment = null,}) {
  return _then(_self.copyWith(
account: freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as AccountModel?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as TimeOfDay,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of OperationFormFields
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountModelCopyWith<$Res>? get account {
    if (_self.account == null) {
    return null;
  }

  return $AccountModelCopyWith<$Res>(_self.account!, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of OperationFormFields
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// @nodoc


class _OperationFormFields implements OperationFormFields {
  const _OperationFormFields({required this.account, required this.category, required this.amount, required this.date, required this.time, required this.comment});
  

@override final  AccountModel? account;
@override final  CategoryModel? category;
@override final  String amount;
@override final  DateTime date;
@override final  TimeOfDay time;
@override final  String comment;

/// Create a copy of OperationFormFields
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OperationFormFieldsCopyWith<_OperationFormFields> get copyWith => __$OperationFormFieldsCopyWithImpl<_OperationFormFields>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperationFormFields&&(identical(other.account, account) || other.account == account)&&(identical(other.category, category) || other.category == category)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,account,category,amount,date,time,comment);

@override
String toString() {
  return 'OperationFormFields(account: $account, category: $category, amount: $amount, date: $date, time: $time, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$OperationFormFieldsCopyWith<$Res> implements $OperationFormFieldsCopyWith<$Res> {
  factory _$OperationFormFieldsCopyWith(_OperationFormFields value, $Res Function(_OperationFormFields) _then) = __$OperationFormFieldsCopyWithImpl;
@override @useResult
$Res call({
 AccountModel? account, CategoryModel? category, String amount, DateTime date, TimeOfDay time, String comment
});


@override $AccountModelCopyWith<$Res>? get account;@override $CategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class __$OperationFormFieldsCopyWithImpl<$Res>
    implements _$OperationFormFieldsCopyWith<$Res> {
  __$OperationFormFieldsCopyWithImpl(this._self, this._then);

  final _OperationFormFields _self;
  final $Res Function(_OperationFormFields) _then;

/// Create a copy of OperationFormFields
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? account = freezed,Object? category = freezed,Object? amount = null,Object? date = null,Object? time = null,Object? comment = null,}) {
  return _then(_OperationFormFields(
account: freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as AccountModel?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as TimeOfDay,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of OperationFormFields
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountModelCopyWith<$Res>? get account {
    if (_self.account == null) {
    return null;
  }

  return $AccountModelCopyWith<$Res>(_self.account!, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of OperationFormFields
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on

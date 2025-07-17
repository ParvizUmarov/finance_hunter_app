// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_lock_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppLockState {

 bool get enabledPinCode; AppLockStatus get status; String? get errorMessage;
/// Create a copy of AppLockState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppLockStateCopyWith<AppLockState> get copyWith => _$AppLockStateCopyWithImpl<AppLockState>(this as AppLockState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppLockState&&(identical(other.enabledPinCode, enabledPinCode) || other.enabledPinCode == enabledPinCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,enabledPinCode,status,errorMessage);

@override
String toString() {
  return 'AppLockState(enabledPinCode: $enabledPinCode, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $AppLockStateCopyWith<$Res>  {
  factory $AppLockStateCopyWith(AppLockState value, $Res Function(AppLockState) _then) = _$AppLockStateCopyWithImpl;
@useResult
$Res call({
 bool enabledPinCode, AppLockStatus status, String? errorMessage
});




}
/// @nodoc
class _$AppLockStateCopyWithImpl<$Res>
    implements $AppLockStateCopyWith<$Res> {
  _$AppLockStateCopyWithImpl(this._self, this._then);

  final AppLockState _self;
  final $Res Function(AppLockState) _then;

/// Create a copy of AppLockState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabledPinCode = null,Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
enabledPinCode: null == enabledPinCode ? _self.enabledPinCode : enabledPinCode // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppLockStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _AppLockState implements AppLockState {
  const _AppLockState({required this.enabledPinCode, required this.status, required this.errorMessage});
  

@override final  bool enabledPinCode;
@override final  AppLockStatus status;
@override final  String? errorMessage;

/// Create a copy of AppLockState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppLockStateCopyWith<_AppLockState> get copyWith => __$AppLockStateCopyWithImpl<_AppLockState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppLockState&&(identical(other.enabledPinCode, enabledPinCode) || other.enabledPinCode == enabledPinCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,enabledPinCode,status,errorMessage);

@override
String toString() {
  return 'AppLockState(enabledPinCode: $enabledPinCode, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AppLockStateCopyWith<$Res> implements $AppLockStateCopyWith<$Res> {
  factory _$AppLockStateCopyWith(_AppLockState value, $Res Function(_AppLockState) _then) = __$AppLockStateCopyWithImpl;
@override @useResult
$Res call({
 bool enabledPinCode, AppLockStatus status, String? errorMessage
});




}
/// @nodoc
class __$AppLockStateCopyWithImpl<$Res>
    implements _$AppLockStateCopyWith<$Res> {
  __$AppLockStateCopyWithImpl(this._self, this._then);

  final _AppLockState _self;
  final $Res Function(_AppLockState) _then;

/// Create a copy of AppLockState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabledPinCode = null,Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_AppLockState(
enabledPinCode: null == enabledPinCode ? _self.enabledPinCode : enabledPinCode // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppLockStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsState {

 ThemeMode get themeMode; Color get primaryColor; Locale get locale; bool get hapticsEnabled; bool get pinCodeEnabled;
/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsStateCopyWith<SettingsState> get copyWith => _$SettingsStateCopyWithImpl<SettingsState>(this as SettingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsState&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.hapticsEnabled, hapticsEnabled) || other.hapticsEnabled == hapticsEnabled)&&(identical(other.pinCodeEnabled, pinCodeEnabled) || other.pinCodeEnabled == pinCodeEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode,primaryColor,locale,hapticsEnabled,pinCodeEnabled);

@override
String toString() {
  return 'SettingsState(themeMode: $themeMode, primaryColor: $primaryColor, locale: $locale, hapticsEnabled: $hapticsEnabled, pinCodeEnabled: $pinCodeEnabled)';
}


}

/// @nodoc
abstract mixin class $SettingsStateCopyWith<$Res>  {
  factory $SettingsStateCopyWith(SettingsState value, $Res Function(SettingsState) _then) = _$SettingsStateCopyWithImpl;
@useResult
$Res call({
 ThemeMode themeMode, Color primaryColor, Locale locale, bool hapticsEnabled, bool pinCodeEnabled
});




}
/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._self, this._then);

  final SettingsState _self;
  final $Res Function(SettingsState) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeMode = null,Object? primaryColor = null,Object? locale = null,Object? hapticsEnabled = null,Object? pinCodeEnabled = null,}) {
  return _then(_self.copyWith(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,primaryColor: null == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as Color,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,hapticsEnabled: null == hapticsEnabled ? _self.hapticsEnabled : hapticsEnabled // ignore: cast_nullable_to_non_nullable
as bool,pinCodeEnabled: null == pinCodeEnabled ? _self.pinCodeEnabled : pinCodeEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _SettingsState implements SettingsState {
  const _SettingsState({required this.themeMode, required this.primaryColor, required this.locale, required this.hapticsEnabled, required this.pinCodeEnabled});
  

@override final  ThemeMode themeMode;
@override final  Color primaryColor;
@override final  Locale locale;
@override final  bool hapticsEnabled;
@override final  bool pinCodeEnabled;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsStateCopyWith<_SettingsState> get copyWith => __$SettingsStateCopyWithImpl<_SettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsState&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.hapticsEnabled, hapticsEnabled) || other.hapticsEnabled == hapticsEnabled)&&(identical(other.pinCodeEnabled, pinCodeEnabled) || other.pinCodeEnabled == pinCodeEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode,primaryColor,locale,hapticsEnabled,pinCodeEnabled);

@override
String toString() {
  return 'SettingsState(themeMode: $themeMode, primaryColor: $primaryColor, locale: $locale, hapticsEnabled: $hapticsEnabled, pinCodeEnabled: $pinCodeEnabled)';
}


}

/// @nodoc
abstract mixin class _$SettingsStateCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory _$SettingsStateCopyWith(_SettingsState value, $Res Function(_SettingsState) _then) = __$SettingsStateCopyWithImpl;
@override @useResult
$Res call({
 ThemeMode themeMode, Color primaryColor, Locale locale, bool hapticsEnabled, bool pinCodeEnabled
});




}
/// @nodoc
class __$SettingsStateCopyWithImpl<$Res>
    implements _$SettingsStateCopyWith<$Res> {
  __$SettingsStateCopyWithImpl(this._self, this._then);

  final _SettingsState _self;
  final $Res Function(_SettingsState) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = null,Object? primaryColor = null,Object? locale = null,Object? hapticsEnabled = null,Object? pinCodeEnabled = null,}) {
  return _then(_SettingsState(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,primaryColor: null == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as Color,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,hapticsEnabled: null == hapticsEnabled ? _self.hapticsEnabled : hapticsEnabled // ignore: cast_nullable_to_non_nullable
as bool,pinCodeEnabled: null == pinCodeEnabled ? _self.pinCodeEnabled : pinCodeEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

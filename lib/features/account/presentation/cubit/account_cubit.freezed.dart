// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountState()';
}


}

/// @nodoc
class $AccountStateCopyWith<$Res>  {
$AccountStateCopyWith(AccountState _, $Res Function(AccountState) __);
}


/// @nodoc


class AccountInitial implements AccountState {
  const AccountInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountState.initial()';
}


}




/// @nodoc


class AccountLoading implements AccountState {
  const AccountLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountState.loading()';
}


}




/// @nodoc


class AccountSuccess implements AccountState {
  const AccountSuccess({required final  List<BankAccountModel> accounts, this.isBalanceHidden = true}): _accounts = accounts;
  

 final  List<BankAccountModel> _accounts;
 List<BankAccountModel> get accounts {
  if (_accounts is EqualUnmodifiableListView) return _accounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accounts);
}

@JsonKey() final  bool isBalanceHidden;

/// Create a copy of AccountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountSuccessCopyWith<AccountSuccess> get copyWith => _$AccountSuccessCopyWithImpl<AccountSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountSuccess&&const DeepCollectionEquality().equals(other._accounts, _accounts)&&(identical(other.isBalanceHidden, isBalanceHidden) || other.isBalanceHidden == isBalanceHidden));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_accounts),isBalanceHidden);

@override
String toString() {
  return 'AccountState.success(accounts: $accounts, isBalanceHidden: $isBalanceHidden)';
}


}

/// @nodoc
abstract mixin class $AccountSuccessCopyWith<$Res> implements $AccountStateCopyWith<$Res> {
  factory $AccountSuccessCopyWith(AccountSuccess value, $Res Function(AccountSuccess) _then) = _$AccountSuccessCopyWithImpl;
@useResult
$Res call({
 List<BankAccountModel> accounts, bool isBalanceHidden
});




}
/// @nodoc
class _$AccountSuccessCopyWithImpl<$Res>
    implements $AccountSuccessCopyWith<$Res> {
  _$AccountSuccessCopyWithImpl(this._self, this._then);

  final AccountSuccess _self;
  final $Res Function(AccountSuccess) _then;

/// Create a copy of AccountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accounts = null,Object? isBalanceHidden = null,}) {
  return _then(AccountSuccess(
accounts: null == accounts ? _self._accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<BankAccountModel>,isBalanceHidden: null == isBalanceHidden ? _self.isBalanceHidden : isBalanceHidden // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class AccountError implements AccountState {
  const AccountError({required this.message});
  

 final  String message;

/// Create a copy of AccountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountErrorCopyWith<AccountError> get copyWith => _$AccountErrorCopyWithImpl<AccountError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AccountState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AccountErrorCopyWith<$Res> implements $AccountStateCopyWith<$Res> {
  factory $AccountErrorCopyWith(AccountError value, $Res Function(AccountError) _then) = _$AccountErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AccountErrorCopyWithImpl<$Res>
    implements $AccountErrorCopyWith<$Res> {
  _$AccountErrorCopyWithImpl(this._self, this._then);

  final AccountError _self;
  final $Res Function(AccountError) _then;

/// Create a copy of AccountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AccountError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

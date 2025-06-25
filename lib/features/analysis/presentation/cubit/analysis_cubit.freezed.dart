// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analysis_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnalysisState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalysisState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnalysisState()';
}


}

/// @nodoc
class $AnalysisStateCopyWith<$Res>  {
$AnalysisStateCopyWith(AnalysisState _, $Res Function(AnalysisState) __);
}


/// @nodoc


class AnalysisInitial implements AnalysisState {
  const AnalysisInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalysisInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnalysisState.initial()';
}


}




/// @nodoc


class AnalysisLoading implements AnalysisState {
  const AnalysisLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalysisLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnalysisState.loading()';
}


}




/// @nodoc


class AnalysisSuccess implements AnalysisState {
  const AnalysisSuccess({required final  List<GroupedTransactionModel> groupedTransactions}): _groupedTransactions = groupedTransactions;
  

 final  List<GroupedTransactionModel> _groupedTransactions;
 List<GroupedTransactionModel> get groupedTransactions {
  if (_groupedTransactions is EqualUnmodifiableListView) return _groupedTransactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groupedTransactions);
}


/// Create a copy of AnalysisState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalysisSuccessCopyWith<AnalysisSuccess> get copyWith => _$AnalysisSuccessCopyWithImpl<AnalysisSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalysisSuccess&&const DeepCollectionEquality().equals(other._groupedTransactions, _groupedTransactions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_groupedTransactions));

@override
String toString() {
  return 'AnalysisState.success(groupedTransactions: $groupedTransactions)';
}


}

/// @nodoc
abstract mixin class $AnalysisSuccessCopyWith<$Res> implements $AnalysisStateCopyWith<$Res> {
  factory $AnalysisSuccessCopyWith(AnalysisSuccess value, $Res Function(AnalysisSuccess) _then) = _$AnalysisSuccessCopyWithImpl;
@useResult
$Res call({
 List<GroupedTransactionModel> groupedTransactions
});




}
/// @nodoc
class _$AnalysisSuccessCopyWithImpl<$Res>
    implements $AnalysisSuccessCopyWith<$Res> {
  _$AnalysisSuccessCopyWithImpl(this._self, this._then);

  final AnalysisSuccess _self;
  final $Res Function(AnalysisSuccess) _then;

/// Create a copy of AnalysisState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? groupedTransactions = null,}) {
  return _then(AnalysisSuccess(
groupedTransactions: null == groupedTransactions ? _self._groupedTransactions : groupedTransactions // ignore: cast_nullable_to_non_nullable
as List<GroupedTransactionModel>,
  ));
}


}

/// @nodoc


class AnalysisError implements AnalysisState {
  const AnalysisError({required this.message});
  

 final  String message;

/// Create a copy of AnalysisState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalysisErrorCopyWith<AnalysisError> get copyWith => _$AnalysisErrorCopyWithImpl<AnalysisError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalysisError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AnalysisState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AnalysisErrorCopyWith<$Res> implements $AnalysisStateCopyWith<$Res> {
  factory $AnalysisErrorCopyWith(AnalysisError value, $Res Function(AnalysisError) _then) = _$AnalysisErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AnalysisErrorCopyWithImpl<$Res>
    implements $AnalysisErrorCopyWith<$Res> {
  _$AnalysisErrorCopyWithImpl(this._self, this._then);

  final AnalysisError _self;
  final $Res Function(AnalysisError) _then;

/// Create a copy of AnalysisState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AnalysisError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

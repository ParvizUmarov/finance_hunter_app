// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OperationDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OperationDetailState()';
}


}

/// @nodoc
class $OperationDetailStateCopyWith<$Res>  {
$OperationDetailStateCopyWith(OperationDetailState _, $Res Function(OperationDetailState) __);
}


/// @nodoc


class OperationDetailInitial implements OperationDetailState {
  const OperationDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OperationDetailState.initial()';
}


}




/// @nodoc


class OperationDetailLoading implements OperationDetailState {
  const OperationDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OperationDetailState.loading()';
}


}




/// @nodoc


class OperationDetailReady implements OperationDetailState {
  const OperationDetailReady({required this.kind, required this.fields, required this.isEditMode, required final  List<AccountModel> accounts, required final  List<CategoryModel> categories, this.isSaving = false, this.errorMessage}): _accounts = accounts,_categories = categories;
  

 final  TransactionKind kind;
 final  OperationFormFields fields;
 final  bool isEditMode;
 final  List<AccountModel> _accounts;
 List<AccountModel> get accounts {
  if (_accounts is EqualUnmodifiableListView) return _accounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accounts);
}

 final  List<CategoryModel> _categories;
 List<CategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@JsonKey() final  bool isSaving;
 final  String? errorMessage;

/// Create a copy of OperationDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperationDetailReadyCopyWith<OperationDetailReady> get copyWith => _$OperationDetailReadyCopyWithImpl<OperationDetailReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationDetailReady&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.fields, fields) || other.fields == fields)&&(identical(other.isEditMode, isEditMode) || other.isEditMode == isEditMode)&&const DeepCollectionEquality().equals(other._accounts, _accounts)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,kind,fields,isEditMode,const DeepCollectionEquality().hash(_accounts),const DeepCollectionEquality().hash(_categories),isSaving,errorMessage);

@override
String toString() {
  return 'OperationDetailState.ready(kind: $kind, fields: $fields, isEditMode: $isEditMode, accounts: $accounts, categories: $categories, isSaving: $isSaving, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $OperationDetailReadyCopyWith<$Res> implements $OperationDetailStateCopyWith<$Res> {
  factory $OperationDetailReadyCopyWith(OperationDetailReady value, $Res Function(OperationDetailReady) _then) = _$OperationDetailReadyCopyWithImpl;
@useResult
$Res call({
 TransactionKind kind, OperationFormFields fields, bool isEditMode, List<AccountModel> accounts, List<CategoryModel> categories, bool isSaving, String? errorMessage
});


$OperationFormFieldsCopyWith<$Res> get fields;

}
/// @nodoc
class _$OperationDetailReadyCopyWithImpl<$Res>
    implements $OperationDetailReadyCopyWith<$Res> {
  _$OperationDetailReadyCopyWithImpl(this._self, this._then);

  final OperationDetailReady _self;
  final $Res Function(OperationDetailReady) _then;

/// Create a copy of OperationDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? fields = null,Object? isEditMode = null,Object? accounts = null,Object? categories = null,Object? isSaving = null,Object? errorMessage = freezed,}) {
  return _then(OperationDetailReady(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as TransactionKind,fields: null == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as OperationFormFields,isEditMode: null == isEditMode ? _self.isEditMode : isEditMode // ignore: cast_nullable_to_non_nullable
as bool,accounts: null == accounts ? _self._accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<AccountModel>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of OperationDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OperationFormFieldsCopyWith<$Res> get fields {
  
  return $OperationFormFieldsCopyWith<$Res>(_self.fields, (value) {
    return _then(_self.copyWith(fields: value));
  });
}
}

/// @nodoc


class OperationDetailSaved implements OperationDetailState {
  const OperationDetailSaved();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationDetailSaved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OperationDetailState.saved()';
}


}




/// @nodoc


class OperationDetailError implements OperationDetailState {
  const OperationDetailError({required this.message});
  

 final  String message;

/// Create a copy of OperationDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperationDetailErrorCopyWith<OperationDetailError> get copyWith => _$OperationDetailErrorCopyWithImpl<OperationDetailError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationDetailError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'OperationDetailState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $OperationDetailErrorCopyWith<$Res> implements $OperationDetailStateCopyWith<$Res> {
  factory $OperationDetailErrorCopyWith(OperationDetailError value, $Res Function(OperationDetailError) _then) = _$OperationDetailErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$OperationDetailErrorCopyWithImpl<$Res>
    implements $OperationDetailErrorCopyWith<$Res> {
  _$OperationDetailErrorCopyWithImpl(this._self, this._then);

  final OperationDetailError _self;
  final $Res Function(OperationDetailError) _then;

/// Create a copy of OperationDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(OperationDetailError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

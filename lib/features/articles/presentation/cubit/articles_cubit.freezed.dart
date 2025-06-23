// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'articles_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ArticlesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticlesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ArticlesState()';
}


}

/// @nodoc
class $ArticlesStateCopyWith<$Res>  {
$ArticlesStateCopyWith(ArticlesState _, $Res Function(ArticlesState) __);
}


/// @nodoc


class ArticleInitial implements ArticlesState {
  const ArticleInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticleInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ArticlesState.initial()';
}


}




/// @nodoc


class ArticleLoading implements ArticlesState {
  const ArticleLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticleLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ArticlesState.loading()';
}


}




/// @nodoc


class ArticleSuccess implements ArticlesState {
  const ArticleSuccess({required final  List<ArticleModel> articles}): _articles = articles;
  

 final  List<ArticleModel> _articles;
 List<ArticleModel> get articles {
  if (_articles is EqualUnmodifiableListView) return _articles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_articles);
}


/// Create a copy of ArticlesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleSuccessCopyWith<ArticleSuccess> get copyWith => _$ArticleSuccessCopyWithImpl<ArticleSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticleSuccess&&const DeepCollectionEquality().equals(other._articles, _articles));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_articles));

@override
String toString() {
  return 'ArticlesState.success(articles: $articles)';
}


}

/// @nodoc
abstract mixin class $ArticleSuccessCopyWith<$Res> implements $ArticlesStateCopyWith<$Res> {
  factory $ArticleSuccessCopyWith(ArticleSuccess value, $Res Function(ArticleSuccess) _then) = _$ArticleSuccessCopyWithImpl;
@useResult
$Res call({
 List<ArticleModel> articles
});




}
/// @nodoc
class _$ArticleSuccessCopyWithImpl<$Res>
    implements $ArticleSuccessCopyWith<$Res> {
  _$ArticleSuccessCopyWithImpl(this._self, this._then);

  final ArticleSuccess _self;
  final $Res Function(ArticleSuccess) _then;

/// Create a copy of ArticlesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? articles = null,}) {
  return _then(ArticleSuccess(
articles: null == articles ? _self._articles : articles // ignore: cast_nullable_to_non_nullable
as List<ArticleModel>,
  ));
}


}

/// @nodoc


class ArticleError implements ArticlesState {
  const ArticleError({required this.message});
  

 final  String message;

/// Create a copy of ArticlesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleErrorCopyWith<ArticleError> get copyWith => _$ArticleErrorCopyWithImpl<ArticleError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticleError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ArticlesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ArticleErrorCopyWith<$Res> implements $ArticlesStateCopyWith<$Res> {
  factory $ArticleErrorCopyWith(ArticleError value, $Res Function(ArticleError) _then) = _$ArticleErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ArticleErrorCopyWithImpl<$Res>
    implements $ArticleErrorCopyWith<$Res> {
  _$ArticleErrorCopyWithImpl(this._self, this._then);

  final ArticleError _self;
  final $Res Function(ArticleError) _then;

/// Create a copy of ArticlesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ArticleError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

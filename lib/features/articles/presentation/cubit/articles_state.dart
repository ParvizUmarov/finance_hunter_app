part of 'articles_cubit.dart';

@freezed
class ArticlesState with _$ArticlesState {
  const factory ArticlesState.initial() = ArticleInitial;

  const factory ArticlesState.loading() = ArticleLoading;

  const factory ArticlesState.success({
    required List<ArticleModel> articles,
  }) = ArticleSuccess;

  const factory ArticlesState.error({
    required String message,
  }) = ArticleError;
}

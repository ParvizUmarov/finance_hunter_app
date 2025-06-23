import 'package:finance_hunter_app/features/articles/presentation/utils/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'articles_state.dart';

part 'articles_cubit.freezed.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  final ArticleRepository repository;

  ArticlesCubit({required this.repository})
    : super(const ArticlesState.initial());

  Future<void> getArticles() async {
    emit(ArticlesState.loading());
    try {
      final response = await repository.getMyArticles();
      emit(ArticlesState.success(articles: response));
    } catch (e) {
      emit(ArticlesState.error(message: e.toString()));
    }
  }
}

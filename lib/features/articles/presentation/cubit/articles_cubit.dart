import 'package:finance_hunter_app/features/articles/presentation/utils/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fuzzy/fuzzy.dart';

part 'articles_state.dart';

part 'articles_cubit.freezed.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  final ArticleRepository repository;

  ArticlesCubit({required this.repository})
    : super(const ArticlesState.initial());

  List<ArticleModel> _allArticles = [];

  Future<void> getArticles() async {
    emit(ArticlesState.loading());
    try {
      final response = await repository.getMyArticles();
      _allArticles = response;
      emit(ArticlesState.success(articles: _allArticles));
    } catch (e) {
      emit(ArticlesState.error(message: e.toString()));
    }
  }

  void searchArticles(String query) {
    if (query.isEmpty) {
      emit(ArticlesState.success(articles: _allArticles));
      return;
    }

    final fuse = Fuzzy<ArticleModel>(
      _allArticles,
      options: FuzzyOptions<ArticleModel>(
        keys: [
          WeightedKey<ArticleModel>(
            getter: (article) => article.name,
            weight: 1,
            name: 'name',
          ),
        ],
        threshold: 0.5,
      ),
    );

    final result = fuse.search(query);
    final filtered = result.map((r) => r.item).toList();

    emit(ArticlesState.success(articles: filtered));
  }
}

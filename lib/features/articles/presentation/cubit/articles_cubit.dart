import 'package:finance_hunter_app/features/articles/presentation/utils/index.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/repositories/category_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fuzzy/fuzzy.dart';

part 'articles_state.dart';

part 'articles_cubit.freezed.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  final CategoryRepository repository;

  ArticlesCubit({required this.repository})
    : super(const ArticlesState.initial());

  List<CategoryModel> _allArticles = [];

  Future<void> getArticles() async {
    emit(ArticlesState.loading());
    await repository.getListOfAllCategories(
      Result(
        onSuccess: (response) {
          _allArticles = response;
          emit(ArticlesState.success(articles: _allArticles));
        },
        onError: (message) {
          emit(ArticlesState.error(message: message.toString()));
        },
      ),
    );
  }

  void searchArticles(String query) {
    if (query.isEmpty) {
      emit(ArticlesState.success(articles: _allArticles));
      return;
    }

    final fuse = Fuzzy<CategoryModel>(
      _allArticles,
      options: FuzzyOptions<CategoryModel>(
        keys: [
          WeightedKey<CategoryModel>(
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

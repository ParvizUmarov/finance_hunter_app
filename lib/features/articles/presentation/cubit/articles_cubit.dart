import 'package:finance_hunter_app/features/articles/presentation/utils/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
  
  void searchArticles(String query){
    if(query.isEmpty){
      emit(ArticlesState.success(articles: _allArticles));
      return;
    }

    final List<ArticleModel> filtered = _allArticles.where((article){
      //TODO some search logic
      return true;
    }).toList();

    emit(ArticlesState.success(articles: filtered));

  }
}

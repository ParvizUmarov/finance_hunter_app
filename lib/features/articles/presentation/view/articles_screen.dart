import 'package:finance_hunter_app/features/articles/presentation/utils/index.dart';

class ArticlesScreen extends StatelessWidget {
  static const String screenName = "articlesScreen";

  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return OfflineAwareScaffold(
      appBar: CustomAppBar(title: s.myArticles),
      body: ArticleScreenBody(),
    );
  }
}

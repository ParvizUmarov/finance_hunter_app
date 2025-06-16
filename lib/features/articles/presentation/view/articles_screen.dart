import 'package:finance_hunter_app/core/core.dart';

class ArticlesScreen extends StatelessWidget {
  static const String screenName = "articlesScreen";

  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.myArticles),
      ),
      body: Center(
        child: Text("Articles Screen"),
      ),
    );
  }
}

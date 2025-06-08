import 'package:finance_hunter_app/core/core.dart';

class ArticlesScreen extends StatelessWidget {
  static const String screenName = "articlesScreen";

  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Мои статьи"),
      ),
      body: Center(
        child: Text("Articles Screen"),
      ),
    );
  }
}

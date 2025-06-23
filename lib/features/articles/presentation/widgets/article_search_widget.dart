import 'package:finance_hunter_app/features/articles/presentation/cubit/articles_cubit.dart';
import 'package:finance_hunter_app/features/articles/presentation/utils/index.dart';

class ArticleSearchWidget extends StatelessWidget {
  const ArticleSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
      ),
      child: ListTile(
        //contentPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 16),
        title: TextField(
          onChanged: (query){
            context.read<ArticlesCubit>().searchArticles(query);
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Найти статью"
          ),
        ),
        trailing: Icon(Icons.search),
      ),
    );
  }
}

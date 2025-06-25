import 'package:finance_hunter_app/features/articles/presentation/cubit/articles_cubit.dart';
import 'package:finance_hunter_app/features/articles/presentation/utils/index.dart';

class ArticleSearchWidget extends StatelessWidget {
  const ArticleSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final articleCubitState = context.watch<ArticlesCubit>();
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
        title: TextField(
          readOnly: articleCubitState.state is ArticleLoading,
          onChanged: (query){
            context.read<ArticlesCubit>().searchArticles(query);
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: s.findAnArticle
          ),
        ),
        trailing: Icon(Icons.search),
      ),
    );
  }
}

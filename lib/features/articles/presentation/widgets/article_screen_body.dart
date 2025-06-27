import 'package:finance_hunter_app/features/articles/presentation/cubit/articles_cubit.dart';
import 'package:finance_hunter_app/features/articles/presentation/utils/index.dart';

class ArticleScreenBody extends StatelessWidget {
  const ArticleScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ArticlesCubit>();

    return Column(
      children: [
        ArticleSearchWidget(),
        Expanded(
          child: BlocStateBuilder<ArticlesCubit, ArticlesState>(
            cubit: cubit,
            whenState:
                ({
              required initial,
              required loading,
              required success,
              required error,
            }) {
              final state = cubit.state;
              return switch (state) {
                ArticleInitial() => initial(),
                ArticleLoading() => loading(),
                ArticleSuccess() => success(state),
                ArticleError(:final message) => error(message),
                ArticlesState() => error("Ошибка"),
              };
            },
            onLoading: (ctx) => CustomShimmer(type: ShimmerType.categoriesList),
            onSuccess: (ctx, state) {
              final articleState = state as ArticleSuccess;

              return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: articleState.articles.length,
                  itemBuilder: (context, index) {
                    final article = articleState.articles[index];
                    return CustomListTile(
                      title: article.name,
                      emoji: article.emoji,
                    );
                  });
            },
          ),
        ),
      ],
    );
  }
}

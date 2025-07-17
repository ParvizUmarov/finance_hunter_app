import 'package:finance_hunter_app/features/analysis/presentation/utils/index.dart';
import 'package:finance_hunter_app/features/transaction_history/presentation/utils/index.dart';

class AnalysisCategoryList extends StatelessWidget {
  const AnalysisCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AnalysisCubit>();
    return BlocStateBuilder<AnalysisCubit, AnalysisState>(
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
              AnalysisInitial() => initial(),
              AnalysisLoading() => loading(),
              AnalysisSuccess() => success(state),
              AnalysisError(:final message) => error(message),
              AnalysisState() => initial(),
            };
          },
      onLoading: (ctx) => CustomShimmer(type: ShimmerType.categoriesList),
      onSuccess: (ctx, state) {
        final analysisState = state as AnalysisSuccess;
        return analysisState.groupedTransactions.isEmpty
            ? EmptyTransactionWidget()
            : ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: analysisState.groupedTransactions.length,
                itemBuilder: (context, index) {
                  final GroupedTransactionModel transaction =
                      analysisState.groupedTransactions[index];
                  return CustomListTile(
                    title: transaction.category.name,
                    emoji: transaction.category.emoji,
                    description: transaction.description,
                    addTrailing: true,
                    onTap: () {
                      DetailCategoryRoute($extra: transaction).push(context);
                    },
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 120),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${transaction.percent}%",
                            style: Theme.of(context).textTheme.bodyLarge,
                            overflow: TextOverflow.ellipsis,
                          ),
                          CurrencyWidget(amount: transaction.amount),
                        ],
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}

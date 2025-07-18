import 'package:finance_hunter_app/features/analysis/presentation/utils/index.dart';

class AnalysisScreenBody extends StatelessWidget {
  const AnalysisScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final analysisCubit = context.watch<AnalysisCubit>();
    return Column(
      children: [
        CustomListTile(
          title: s.periodStart,
          onTap: analysisCubit.state is AnalysisLoading
              ? null
              : () async {
                  await customShowDatePicker(
                    initialDate: analysisCubit.selectedStartDateTime,
                    context: context,
                    onSelectedDate: (selectedDate) {
                      context
                          .read<AnalysisCubit>()
                          .getGroupedTransactionByCategory(
                            TransactionDateFilter(startDate: selectedDate),
                          );
                    },
                  );
                },
          child: DateTimeContainer(date: analysisCubit.selectedStartDateTime),
        ),
        CustomListTile(
          title: s.periodEnd,
          onTap: analysisCubit.state is AnalysisLoading
              ? null
              : () async {
                  await customShowDatePicker(
                    initialDate: analysisCubit.selectedEndDateTime,
                    context: context,
                    onSelectedDate: (selectedDate) {
                      context
                          .read<AnalysisCubit>()
                          .getGroupedTransactionByCategory(
                            TransactionDateFilter(endDate: selectedDate),
                          );
                    },
                  );
                },
          child: DateTimeContainer(date: analysisCubit.selectedEndDateTime),
        ),
        CustomListTile(
          title: s.amount,
          child: CurrencyWidget(amount: analysisCubit.totalAmount.toStringAsFixed(2)),
        ),
        AnalysisGraphics(),
        Expanded(child: AnalysisCategoryList()),
      ],
    );
  }
}

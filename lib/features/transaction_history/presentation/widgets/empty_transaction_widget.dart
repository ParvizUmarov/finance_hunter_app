import 'package:finance_hunter_app/features/transaction_history/presentation/utils/index.dart';

class EmptyTransactionWidget extends StatelessWidget {
  const EmptyTransactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Assets.images.empty.image(),
            SizedBox(height: 10,),
            Text(s.noTransactionForThisPeriod),
          ],
        ),
      ),
    );
  }
}

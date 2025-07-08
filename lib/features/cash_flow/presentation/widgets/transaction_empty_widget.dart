import 'package:finance_hunter_app/features/cash_flow/presentation/utils/index.dart';

class TransactionEmptyWidget extends StatelessWidget {
  const TransactionEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 4,),
            Icon(Icons.inbox, size: 64, color: Colors.grey),
            const SizedBox(height: 12),
            Text(
              'Сегодня у вас нет транзакций',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}

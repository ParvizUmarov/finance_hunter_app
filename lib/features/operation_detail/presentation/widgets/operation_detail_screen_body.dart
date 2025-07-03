import 'package:finance_hunter_app/features/operation_detail/presentation/utils/index.dart';

class OperationDetailScreenBody extends StatelessWidget {
  const OperationDetailScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomListTile(title: "Счет", data: "Сбербанк", addTrailing: true),
        CustomListTile(title: "Статья", data: "Ремонт", addTrailing: true),
        CustomListTile(
          title: "Сумма",
          child: CurrencyWidget(amount: "24 750"),
        ),
        CustomListTile(title: "Дата", data: "25.02.2025"),
        CustomListTile(title: "Время", data: "23:41"),
        CustomListTile(title: "Коментарий"),
        const SizedBox(height: 10),
        DeleteOperationButton()
      ],
    );
  }
}

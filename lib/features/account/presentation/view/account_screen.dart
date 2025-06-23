import 'package:finance_hunter_app/features/account/presentation/utils/index.dart';

class AccountScreen extends StatelessWidget {
  static const String screenName = "accountScreen";

  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Мой счет")),
      body: Column(
        children: [
          CustomListTile(
            emoji: "💰",
            title: "Баланс",
            backgroundColor: LightAppColors.secondaryBrandColor,
            data: "-670 000 ₽",
            addTrailing: true,
            emojiBackgroundColor: Colors.white,
          ),
          CustomListTile(
            title: "Валюта",
            addTrailing: true,
            data: "₽",
            backgroundColor: LightAppColors.secondaryBrandColor,
          ),
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(
          onTap: (){

          }),
    );
  }
}

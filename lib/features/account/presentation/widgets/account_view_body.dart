import 'package:finance_hunter_app/features/account/presentation/utils/index.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AccountCubit>();
    return BlocStateBuilder(
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
              AccountInitial() => initial(),
              AccountLoading() => loading(),
              AccountSuccess() => success(state),
              AccountError(:final message) => error(message),
              AccountState() => error("Ошибка"),
            };
          },
      onLoading: (ctx) => CustomShimmer(type: ShimmerType.myAccount),
      onSuccess: (ctx, state) {
        final accountState = state as AccountSuccess;
        final firstAccount = accountState.accounts.first;
        return Column(
          children: [
            CustomListTile(
              emoji: "💰",
              title: "Баланс",
              backgroundColor: LightAppColors.secondaryBrandColor,
              data: "${firstAccount.balance} ₽",
              addTrailing: true,
              emojiBackgroundColor: Colors.white,
            ),
            CustomListTile(
              title: "Валюта",
              addTrailing: true,
              data: "₽",
              backgroundColor: LightAppColors.secondaryBrandColor,
              onTap: () async {
                await showCurrencyBottomSheet(context, (value){});
              },
            ),
          ],
        );
      },
    );
  }
}

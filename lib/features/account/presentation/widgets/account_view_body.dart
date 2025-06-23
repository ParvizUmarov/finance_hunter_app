import 'dart:developer';

import 'package:finance_hunter_app/features/account/presentation/utils/index.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final accountCubit = context.watch<AccountCubit>();
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        if (state is AccountLoading) {
          return const CustomShimmer(type: ShimmerType.myAccount);
        } else if (state is AccountSuccess) {
          final firstAccount = state.accounts.first;
          return Column(
            children: [
              CustomListTile(
                emoji: "💰",
                title: "Баланс",
                backgroundColor: LightAppColors.secondaryBrandColor,
                content: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(firstAccount.balance),
                    const SizedBox(width: 5,),
                    SvgPicture.asset(
                      accountCubit.currentCurrency.icon,
                      height: 18,
                    ),
                  ],
                ),
                addTrailing: true,
                emojiBackgroundColor: Colors.white,
              ),
              CustomListTile(
                title: "Валюта",
                addTrailing: true,
                content: SvgPicture.asset(
                  accountCubit.currentCurrency.icon,
                  height: 18,
                ),
                backgroundColor: LightAppColors.secondaryBrandColor,
                onTap: () async {
                  await showCurrencyBottomSheet(context, (value) {
                    log("selected currency: $value");
                    context.read<AccountCubit>().selectCurrency(value);
                  });
                },
              ),
            ],
          );
        } else if (state is AccountError) {
          return ErrorBaseWidget(errorMessage: state.message);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

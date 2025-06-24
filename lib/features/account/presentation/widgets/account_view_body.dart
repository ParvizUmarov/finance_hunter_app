import 'dart:developer';

import 'package:finance_hunter_app/features/account/presentation/utils/index.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final currencyCubit = context.watch<CurrencyCubit>();
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
                addTrailing: true,
                emojiBackgroundColor: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(firstAccount.balance),
                    const SizedBox(width: 5,),
                    SvgPicture.asset(
                      currencyCubit.state.icon,
                      height: 18,
                    ),
                  ],
                ),
              ),
              CustomListTile(
                title: "Валюта",
                addTrailing: true,
                backgroundColor: LightAppColors.secondaryBrandColor,
                onTap: () async {
                  await showCurrencyBottomSheet(context, (value) {
                    log("selected currency: $value");
                    context.read<CurrencyCubit>().selectCurrency(value);
                  });
                },
                child: SvgPicture.asset(
                  currencyCubit.state.icon,
                  height: 18,
                ),
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

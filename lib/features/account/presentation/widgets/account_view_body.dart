import 'dart:async';
import 'dart:developer';

import 'package:finance_hunter_app/features/account/presentation/utils/index.dart';

class AccountViewBody extends StatefulWidget {
  const AccountViewBody({super.key});

  @override
  State<AccountViewBody> createState() => _AccountViewBodyState();
}

class _AccountViewBodyState extends State<AccountViewBody> {
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    final currencyCubit = context.watch<CurrencyCubit>();

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 2));
        if (context.mounted) {
          context.read<AccountCubit>().getAccounts();
        }
      },
      child: BlocBuilder<AccountCubit, AccountState>(
        builder: (context, state) {
          if (state is AccountLoading) {
            return const CustomShimmer(type: ShimmerType.myAccount);
          } else if (state is AccountSuccess) {
            final firstAccount = state.account;
            return ListView(
              children: [
                CustomListTile(
                  emoji: "💰",
                  title: s.balance,
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  addTrailing: true,
                  emojiBackgroundColor: Colors.white,
                  child: BalanceSpoiler(
                    balance: firstAccount.balance,
                    isHidden: state.isBalanceHidden,
                    onToggle: () =>
                        context.read<AccountCubit>().toggleBalanceVisibility(),
                  ),
                ),
                CustomListTile(
                  title: s.currency,
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  addTrailing: true,
                  onTap: () async {
                    await showCurrencyBottomSheet(context, (value) async {
                      await context.read<CurrencyCubit>().selectCurrency(value);
                    });
                  },
                  child: SvgPicture.asset(
                    currencyCubit.state.icon,
                    height: 18,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onSurface,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                AspectRatio(
                  aspectRatio: 1.5,
                  child: BarChartWithSegmentedControl(
                    entries: state.transactions
                        .map(
                          (t) => BalanceEntry(
                            date: t.transactionDate,
                            amount: double.tryParse(t.amount) ?? 0.0,
                          ),
                        )
                        .toList(),
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
      ),
    );
  }
}

import 'dart:async';

import 'package:finance_hunter_app/features/account/presentation/utils/index.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AccountViewBody extends StatefulWidget {
  const AccountViewBody({super.key});

  @override
  State<AccountViewBody> createState() => _AccountViewBodyState();
}

class _AccountViewBodyState extends State<AccountViewBody> {
  StreamSubscription? _sensorSubscription;

  @override
  void initState() {
    super.initState();
    const double gravityThreshold = -9.5;
    final accountCubit = context.read<AccountCubit>();

    _sensorSubscription = accelerometerEventStream().listen((event) {
      final z = event.z;
      if (z < gravityThreshold) {
        if (context.mounted) {
          accountCubit.toggleBalanceVisibility();
        }
      }
    });
  }

  @override
  void dispose() {
    _sensorSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final currencyCubit = context.watch<CurrencyCubit>();
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 2));
        if(context.mounted){
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

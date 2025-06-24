import 'package:finance_hunter_app/features/account/presentation/utils/index.dart';

import 'dart:ui';

class BalanceSpoiler extends StatelessWidget {
  final String balance;
  final Widget currencyIcon;
  final bool isHidden;
  final VoidCallback onToggle;

  const BalanceSpoiler({
    super.key,
    required this.balance,
    required this.currencyIcon,
    required this.isHidden,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(balance),
              const SizedBox(width: 5),
              currencyIcon,
            ],
          ),
          if (isHidden)
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}


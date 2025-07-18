import 'package:finance_hunter_app/features/account/presentation/utils/index.dart';

import 'dart:ui';

class BalanceSpoiler extends StatefulWidget {
  final String balance;
  final bool isHidden;
  final VoidCallback onToggle;

  const BalanceSpoiler({
    super.key,
    required this.balance,
    required this.isHidden,
    required this.onToggle,
  });

  @override
  State<BalanceSpoiler> createState() => _BalanceSpoilerState();
}

class _BalanceSpoilerState extends State<BalanceSpoiler>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _blurAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _blurAnimation = Tween<double>(begin: 0.0, end: 5.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    if (widget.isHidden) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant BalanceSpoiler oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isHidden != oldWidget.isHidden) {
      if (widget.isHidden) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: widget.onToggle,
      child: AnimatedBuilder(
        animation: _blurAnimation,
        builder: (context, child) {
          return ClipRect(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Expanded(child: CurrencyWidget(amount: widget.balance)),
                if (_blurAnimation.value > 0)
                  BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: _blurAnimation.value,
                      sigmaY: _blurAnimation.value,
                    ),
                    child: Container(
                      color: Colors.transparent,
                      height: 30,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}


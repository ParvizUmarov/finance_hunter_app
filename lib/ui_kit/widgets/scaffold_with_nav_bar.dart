import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter/services.dart';

import '../ui_kit.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  const ScaffoldWithNavBar({Key? key, required this.navigationShell})
    : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final navItems = [
      (s.expenses, Assets.icons.icExpenses),
      (s.income, Assets.icons.icIncome),
      (s.account, Assets.icons.icAccount),
      (s.articles, Assets.icons.icArticles),
      (s.settings, Assets.icons.icSettings),
    ];
    Widget scaffold = Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: (index) => _onTap(context, index),
        destinations: navItems.map((item) {
          final label = item.$1;
          final iconAsset = item.$2;
          return NavigationDestination(
            selectedIcon: _buildIcon(iconAsset, isActive: true),
            icon: _buildIcon(iconAsset, isActive: false),
            label: label,
          );
        }).toList(),
      ),
    );
    return scaffold;
  }

  void _onTap(BuildContext context, int index) {
    final currentIndex = widget.navigationShell.currentIndex;

    if (index != currentIndex) {
      final hapticsEnabled = context.read<SettingsCubit>().state.hapticsEnabled;

      if (hapticsEnabled) {
        HapticFeedback.selectionClick();
      }
    }
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  Widget _buildIcon(
    String iconAsset, {
    required bool isActive,
    bool colored = true,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return SvgPicture.asset(
      iconAsset,
      colorFilter: colored
          ? ColorFilter.mode(
              isActive ? colorScheme.primary : colorScheme.onSurfaceVariant,
              BlendMode.srcIn,
            )
          : null,
    );
  }
}

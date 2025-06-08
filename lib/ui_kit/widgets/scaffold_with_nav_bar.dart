import 'package:finance_hunter_app/core/core.dart';

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
    final unSelectedColor = Theme.of(context).colorScheme.onSurfaceVariant;
    final labelStyle = Theme.of(context).textTheme.labelMedium?.copyWith(
        color: unSelectedColor,
        fontWeight: FontWeight.w600
    );

    Widget scaffold = Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        useLegacyColorScheme: false,
        showUnselectedLabels: true,
        selectedLabelStyle: labelStyle,
        unselectedLabelStyle: labelStyle,
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(Assets.icons.icExpenses, isActive: false),
            activeIcon: _buildIcon(Assets.icons.icExpenses, isActive: true),
            label: 'Расходы',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Assets.icons.icIncome, isActive: false),
            activeIcon: _buildIcon(Assets.icons.icIncome, isActive: true),
            label: 'Доходы',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(
              Assets.icons.icAccount,
              isActive: false,
            ),
            activeIcon: _buildIcon(
              Assets.icons.icAccount,
              isActive: true,
            ),
            label: 'Счет',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Assets.icons.icArticles, isActive: false),
            activeIcon: _buildIcon(Assets.icons.icArticles, isActive: true),
            label: "Статьи",
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Assets.icons.icSettings, isActive: false),
            activeIcon: _buildIcon(Assets.icons.icSettings, isActive: true),
            label: "Настройки",
          ),
        ],
        currentIndex: widget.navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
    return scaffold;
  }

  void _onTap(BuildContext context, int index) {
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 3.0, top: 3.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 18),
        decoration: BoxDecoration(
          color: isActive ? AppColors.secondaryBrandColor : null,
          borderRadius: BorderRadius.circular(20)
        ),
        child: SvgPicture.asset(
          iconAsset,
          colorFilter: colored
              ? ColorFilter.mode(
                  isActive
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                  BlendMode.srcIn,
                )
              : null,
        ),
      ),
    );
  }
}

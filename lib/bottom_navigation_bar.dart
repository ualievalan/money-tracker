import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppleBottomNavBar extends StatelessWidget {
  const AppleBottomNavBar({
    required this.currentIndex,
    required this.isDark,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final bool isDark;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    const selectedColor = Color(0xFF007AFF);
    const unselectedColor = Color(0xFF8E8E93);
    const panelColor = Color(0xFF2C2C2E);

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: panelColor,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: const Color(0xFF3A3A3C).withValues(alpha: 0.6),
              width: 0.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 20,
                offset: const Offset(0, 4),
                spreadRadius: 0,
              ),

              BoxShadow(
                color: const Color(0xFF1C1C1E).withValues(alpha: 0.6),
                blurRadius: 15,
                spreadRadius: -3,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _NavItem(
                icon: Icons.flag_outlined,
                selectedIcon: Icons.flag,
                label: 'Главная',
                index: 0,
                isSelected: currentIndex == 0,
                selectedColor: selectedColor,
                unselectedColor: unselectedColor,
                onTap: () {
                  HapticFeedback.selectionClick();
                  onTap(0);
                },
              ),
              _NavItem(
                icon: Icons.task,
                selectedIcon: Icons.task,
                label: 'Дела',
                index: 1,
                isSelected: currentIndex == 1,
                selectedColor: selectedColor,
                unselectedColor: unselectedColor,
                onTap: () {
                  HapticFeedback.selectionClick();
                  onTap(1);
                },
              ),
              _NavItem(
                icon: Icons.account_balance_wallet_outlined,
                selectedIcon: Icons.account_balance_wallet,
                label: 'Расходы',
                index: 2,
                isSelected: currentIndex == 2,
                selectedColor: selectedColor,
                unselectedColor: unselectedColor,
                onTap: () {
                  HapticFeedback.selectionClick();
                  onTap(2);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.index,
    required this.isSelected,
    required this.selectedColor,
    required this.unselectedColor,
    required this.onTap,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final int index;
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          splashColor: selectedColor.withValues(alpha: 0.1),
          highlightColor: selectedColor.withValues(alpha: 0.05),
          child: Container(
            width: 20,
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  isSelected ? selectedIcon : icon,
                  size: 22,
                  color: isSelected ? selectedColor : unselectedColor,
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? selectedColor : unselectedColor,
                    letterSpacing: -0.15,
                    height: 1.0,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

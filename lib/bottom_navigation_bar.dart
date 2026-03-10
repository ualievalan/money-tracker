import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_tracker/core/localization/app_localizations.dart';

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
    final loc = AppLocalizations.of(context);
    final selectedColor = isDark ? Colors.white : Colors.black;
    final unselectedColor = isDark
        ? Colors.grey.shade600
        : Colors.grey.shade400;

    final glassColor = isDark
        ? Colors.black.withValues(alpha: 0.5)
        : Colors.white.withValues(alpha: 0.6);

    final borderColor = isDark
        ? Colors.white.withValues(alpha: 0.15)
        : Colors.black.withValues(alpha: 0.05);

    return SafeArea(
      bottom: true,
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32, bottom: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: GestureDetector(
              onHorizontalDragEnd: (details) {
                const sensitivity = 0;
                if (details.primaryVelocity! < -sensitivity) {
                  if (currentIndex < 2) {
                    HapticFeedback.lightImpact();
                    onTap(currentIndex + 1);
                  }
                } else if (details.primaryVelocity! > sensitivity) {
                  if (currentIndex > 0) {
                    HapticFeedback.lightImpact();
                    onTap(currentIndex - 1);
                  }
                }
              },
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  color: glassColor,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: borderColor, width: 1.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _NavItem(
                      icon: Icons.home_rounded,
                      label: loc.home,
                      isSelected: currentIndex == 0,
                      selectedColor: selectedColor,
                      unselectedColor: unselectedColor,
                      onTap: () {
                        HapticFeedback.lightImpact();
                        onTap(0);
                      },
                    ),
                    _NavItem(
                      icon: Icons.check_circle_outline_rounded,
                      label: loc.tasks,
                      isSelected: currentIndex == 1,
                      selectedColor: selectedColor,
                      unselectedColor: unselectedColor,
                      onTap: () {
                        HapticFeedback.lightImpact();
                        onTap(1);
                      },
                    ),
                    _NavItem(
                      icon: Icons.account_balance_wallet_rounded,
                      label: loc.transactions,
                      isSelected: currentIndex == 2,
                      selectedColor: selectedColor,
                      unselectedColor: unselectedColor,
                      onTap: () {
                        HapticFeedback.lightImpact();
                        onTap(2);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.selectedColor,
    required this.unselectedColor,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCirc,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 20 : 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? selectedColor.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected ? selectedColor : unselectedColor,
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: selectedColor,
                  letterSpacing: -0.2,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:money_tracker/core/localization/app_localizations.dart';

class AppDrawer extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onSelect;

  const AppDrawer({
    super.key,
    required this.currentIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              loc.menu,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(loc.home),
            selected: currentIndex == 0,
            onTap: () => onSelect(0),
          ),
          ListTile(
            leading: const Icon(Icons.receipt),
            title: Text(loc.transactions),
            selected: currentIndex == 1,
            onTap: () => onSelect(1),
          ),
        ],
      ),
    );
  }
}
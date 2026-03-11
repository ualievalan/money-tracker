import 'package:flutter/material.dart';
import 'package:money_tracker/core/localization/app_localizations.dart';

class AppDrawer extends StatelessWidget {
  final Function(int) onSelect;

  const AppDrawer({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: theme.primaryColor),
            child: Text(
              loc.menu,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(loc.home),
            onTap: () {
              onSelect(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.receipt_long),
            title: Text(loc.transactions),
            onTap: () {
              onSelect(1);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
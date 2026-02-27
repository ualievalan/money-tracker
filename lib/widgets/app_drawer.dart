import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final Function(int) onSelect;

  const AppDrawer({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: theme.primaryColor),
            child: const Text(
              'Меню',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Главная'),
            onTap: () {
              onSelect(0); // переключаем экран
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.receipt_long),
            title: const Text('Транзакции'),
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
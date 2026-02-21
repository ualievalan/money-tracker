import 'package:flutter/material.dart';

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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Меню',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Главная'),
            selected: currentIndex == 0,
            onTap: () => onSelect(0),
          ),
          ListTile(
            leading: const Icon(Icons.receipt),
            title: const Text('переводы'),
            selected: currentIndex == 1,
            onTap: () => onSelect(1),
          ),
        ],
      ),
    );
  }
}
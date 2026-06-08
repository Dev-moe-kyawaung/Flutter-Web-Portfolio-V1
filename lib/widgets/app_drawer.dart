import 'package:flutter/material.dart';
import '../app_theme.dart';

class AppDrawer extends StatelessWidget {
  final List<(String, VoidCallback)> items;
  const AppDrawer({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.panel,
      child: ListView(
        padding: const EdgeInsets.only(top: 54),
        children: [
          const ListTile(
            title: Text('MKA', style: TextStyle(fontWeight: FontWeight.w900, color: AppTheme.cyan)),
            subtitle: Text('Cyber Portfolio'),
          ),
          const Divider(color: AppTheme.border),
          ...items.map(
            (e) => ListTile(
              title: Text(e.$1),
              onTap: e.$2,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/navigation_provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = context.read<NavigationProvider>();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.school, size: 48, color: Colors.white),
                SizedBox(height: 10),
                Text(
                  'StudentHub Portal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'TMA3084 Software Engineering Lab',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          _buildDrawerItem(context, Icons.home, 'Home', 0, navProvider),
          _buildDrawerItem(
            context,
            Icons.people,
            'Student Information',
            1,
            navProvider,
          ),
          _buildDrawerItem(
            context,
            Icons.table_chart,
            'Student Records',
            2,
            navProvider,
          ),
          _buildDrawerItem(
            context,
            Icons.category,
            'Programmes / Categories',
            3,
            navProvider,
          ),
          _buildDrawerItem(
            context,
            Icons.info_outline,
            'About / Profile',
            4,
            navProvider,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context,
    IconData icon,
    String title,
    int index,
    NavigationProvider provider,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      selected: provider.currentIndex == index,
      onTap: () {
        provider.setIndex(index);
        Navigator.pop(context); // Close the drawer
      },
    );
  }
}

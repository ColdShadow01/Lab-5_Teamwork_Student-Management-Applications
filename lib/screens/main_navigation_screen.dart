import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/navigation_provider.dart';
import '../widgets/app_drawer.dart';
import 'home_page.dart';
import 'student_records_screen.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Rebuilds only when the navigation index changes
    final currentIndex = context.select<NavigationProvider, int>(
      (p) => p.currentIndex,
    );

    // List of pages (Teammates will replace the Placeholders with their actual pages)
    final List<Widget> pages = [
      const HomePage(),
      const Center(
        child: Text('Student Info Page (Member 2)'),
      ), // Replace later
      const StudentRecordsScreen(),
      const Center(child: Text('Programmes Page (Member 4)')), // Replace later
      const Center(child: Text('About Page (Member 5)')), // Replace later
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'StudentHub',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      drawer: const AppDrawer(),
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          context.read<NavigationProvider>().setIndex(index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: 'Students',
          ),
          NavigationDestination(
            icon: Icon(Icons.table_chart_outlined),
            selectedIcon: Icon(Icons.table_chart),
            label: 'Records',
          ),
          NavigationDestination(
            icon: Icon(Icons.category_outlined),
            selectedIcon: Icon(Icons.category),
            label: 'Programmes',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'About',
          ),
        ],
      ),
    );
  }
}

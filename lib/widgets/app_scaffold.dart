import 'package:flutter/material.dart';
import 'package:vetted_lens/main.dart' as main; // FIX: Import main with a prefix

// --- Shared Helper: Desktop Navigation Row (FIXED) ---
List<Widget> buildDesktopNav(BuildContext context) {
  final textColor = Theme.of(context).appBarTheme.foregroundColor;
  return main.pageRoutes.entries.map((entry) { // Access using main.pageRoutes
    if (entry.key == '/') return const SizedBox(); 
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, entry.key),
      child: Text(
        entry.value.toUpperCase(),
        style: TextStyle(color: textColor, fontWeight: FontWeight.w600, fontSize: 13),
      ),
    );
  }).toList();
}

// --- Shared Component 1: Navigation Drawer (Mobile/Tablet Menu) (FIXED) ---
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: const Text(
              'Vetted Lens',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          ...main.pageRoutes.entries.map((entry) { // Access using main.pageRoutes
            return ListTile(
              title: Text(entry.value),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, entry.key);
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}

// --- Shared Component 2: Universal Footer ---
class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      color: const Color(0xFF1942A0), 
      child: Column(
        children: [
          Text(
            'Stop searching. Start shooting. Book your Vetted Lens Pro.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.blue.shade100),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/pricing'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF1942A0),
              elevation: 0,
            ),
            child: const Text('START YOUR BOOKING TODAY', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 40),
          Divider(color: Colors.blue.shade700),
          const SizedBox(height: 10),
          Text(
            '© 2025 Vetted Lens, Inc. All rights reserved.',
            style: TextStyle(color: Colors.blue.shade400, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

// --- Shared Component 3: Universal Placeholder Page Scaffold ---
class PlaceholderPage extends StatelessWidget {
  final String title;
  const PlaceholderPage({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        automaticallyImplyLeading: !isDesktop, 
        actions: isDesktop ? buildDesktopNav(context) : null,
      ),
      drawer: isDesktop ? null : const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the $title Page.', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text('This page is using the universal Placeholder. We will build its content soon!', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
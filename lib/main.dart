import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const PackageTrackerApp());
}

class PackageTrackerApp extends StatelessWidget {
  const PackageTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Package Tracker',
      theme: AppTheme.theme,
      home: const HomeScreen(),
    );
  }
}
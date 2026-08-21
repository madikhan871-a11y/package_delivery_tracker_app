import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 70,
      backgroundColor: AppColors.surface,
      indicatorColor:
      AppColors.primary.withValues(alpha: .10),
      selectedIndex: currentIndex,
      onDestinationSelected: onChanged,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(
            Icons.home_rounded,
            color: AppColors.primary,
          ),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.local_shipping_outlined,
          ),
          selectedIcon: Icon(
            Icons.local_shipping_rounded,
            color: AppColors.primary,
          ),
          label: 'Tracking',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.person_outline_rounded,
          ),
          selectedIcon: Icon(
            Icons.person_rounded,
            color: AppColors.primary,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
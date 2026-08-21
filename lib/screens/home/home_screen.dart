import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../data/package_data.dart';
import '../../models/package.dart';
import '../../widgets/app_bottom_nav.dart';
import '../../widgets/package_card.dart';
import '../add_package/add_package_screen.dart';
import '../package_details/package_details_screen.dart';
import '../profile/profile_screen.dart';
import '../tracking/tracking_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      _home(),
      const TrackingScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: AppBottomNav(
        currentIndex: currentIndex,
        onChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      floatingActionButton: currentIndex == 0
          ? FloatingActionButton(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
              const AddPackageScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      )
          : null,
    );
  }

  Widget _home() {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          20,
          20,
          20,
          90,
        ),
        children: [
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, Madiha 👋',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Track your packages',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 43,
                height: 43,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius:
                  BorderRadius.circular(14),
                  border: Border.all(
                    color: AppColors.border,
                  ),
                ),
                child: const Icon(
                  Icons.notifications_none_rounded,
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          _searchBox(),
          const SizedBox(height: 22),
          _trackingBanner(),
          const SizedBox(height: 25),
          const Text(
            'My Packages',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          ...PackageData.packages
              .take(3)
              .map(
                (package) => PackageCard(
              package: package,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        PackageDetailsScreen(
                          package: package,
                        ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchBox() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter tracking number...',
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: AppColors.primary,
        ),
        suffixIcon: Container(
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.arrow_forward_rounded,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }

  Widget _trackingBanner() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.navy,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your next delivery',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 9,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Out for delivery',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 7),
                const Text(
                  'Arriving today • 2:00 PM - 5:00 PM',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 8,
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  height: 32,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      AppColors.primary,
                      foregroundColor: Colors.white,
                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 13,
                      ),
                    ),
                    child: const Text(
                      'Track Package',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 82,
            height: 82,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(
                alpha: .18,
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.local_shipping_rounded,
              color: AppColors.primary,
              size: 38,
            ),
          ),
        ],
      ),
    );
  }
}
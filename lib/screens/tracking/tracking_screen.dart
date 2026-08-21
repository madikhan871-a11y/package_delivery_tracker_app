import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../data/package_data.dart';
import '../../widgets/delivery_progress.dart';
import '../../widgets/status_badge.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final package = PackageData.packages.first;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Live Tracking',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Follow your package journey.',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.border,
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tracking Number',
                            style: TextStyle(
                              color:
                              AppColors.textSecondary,
                              fontSize: 8,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'PKG-842917',
                            style: TextStyle(
                              color:
                              AppColors.textPrimary,
                              fontSize: 15,
                              fontWeight:
                              FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    StatusBadge(
                      status: package.status,
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                const DeliveryProgress(
                  progress: .82,
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lahore',
                      style: TextStyle(
                        color:
                        AppColors.textSecondary,
                        fontSize: 8,
                      ),
                    ),
                    Text(
                      'Vehari',
                      style: TextStyle(
                        color:
                        AppColors.textPrimary,
                        fontSize: 8,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const Text(
            'Delivery Route',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 15),
          _routeCard(),
          const SizedBox(height: 22),
          const Text(
            'Estimated Delivery',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.event_available_rounded,
                  color: Colors.white,
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      'August 23, 2026',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '2:00 PM - 5:00 PM',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _routeCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        children: [
          _routePoint(
            'Lahore Distribution Center',
            'Package picked up',
            true,
          ),
          _routeLine(),
          _routePoint(
            'Multan Sorting Facility',
            'Package processed',
            true,
          ),
          _routeLine(),
          _routePoint(
            'Vehari Delivery Hub',
            'Courier is delivering',
            true,
          ),
        ],
      ),
    );
  }

  Widget _routePoint(
      String title,
      String subtitle,
      bool active,
      ) {
    return Row(
      children: [
        Container(
          width: 13,
          height: 13,
          decoration: BoxDecoration(
            color: active
                ? AppColors.primary
                : AppColors.border,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 10,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              subtitle,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 8,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _routeLine() {
    return Container(
      margin: const EdgeInsets.only(
        left: 6,
        top: 3,
        bottom: 3,
      ),
      width: 2,
      height: 27,
      color: AppColors.primary.withValues(
        alpha: .25,
      ),
    );
  }
}
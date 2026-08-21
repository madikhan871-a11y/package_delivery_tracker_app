import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../models/package.dart';
import 'status_badge.dart';

class PackageCard extends StatelessWidget {
  final PackageItem package;
  final VoidCallback onTap;

  const PackageCard({
    super.key,
    required this.package,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 13),
        padding: const EdgeInsets.all(16),
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
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(
                      alpha: .09,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.inventory_2_outlined,
                    color: AppColors.primary,
                    size: 23,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        package.title,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        package.trackingNumber,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 9,
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
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: _location(
                    Icons.circle,
                    package.origin,
                    'From',
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: AppColors.primary,
                  size: 18,
                ),
                Expanded(
                  child: _location(
                    Icons.location_on_rounded,
                    package.destination,
                    'To',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: package.progress,
                minHeight: 6,
                backgroundColor:
                AppColors.border,
                valueColor:
                const AlwaysStoppedAnimation(
                  AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _location(
      IconData icon,
      String location,
      String label,
      ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 9,
          color: AppColors.primary,
        ),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 7,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              location,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
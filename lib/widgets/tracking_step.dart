import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class TrackingStep extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final bool completed;
  final bool active;
  final bool isLast;

  const TrackingStep({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.completed,
    required this.active,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final color = completed || active
        ? AppColors.primary
        : AppColors.border;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 32,
            child: Column(
              children: [
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: completed || active
                        ? AppColors.primary
                        : AppColors.surface,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: color,
                      width: 2,
                    ),
                  ),
                  child: completed
                      ? const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 8,
                  )
                      : null,
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin:
                      const EdgeInsets.symmetric(
                        vertical: 3,
                      ),
                      color: color,
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:
              const EdgeInsets.only(bottom: 25),
              child: Row(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: completed || active
                                ? AppColors.textPrimary
                                : AppColors.textSecondary,
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 7,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
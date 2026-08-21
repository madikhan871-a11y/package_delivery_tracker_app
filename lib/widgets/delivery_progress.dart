import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class DeliveryProgress extends StatelessWidget {
  final double progress;

  const DeliveryProgress({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 5,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius:
                BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              widthFactor: progress,
              child: Container(
                height: 5,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius:
                  BorderRadius.circular(10),
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: progress,
              alignment: Alignment.centerLeft,
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.local_shipping_rounded,
                    color: Colors.white,
                    size: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
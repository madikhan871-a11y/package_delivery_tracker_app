import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../models/package.dart';

class StatusBadge extends StatelessWidget {
  final PackageStatus status;

  const StatusBadge({
    super.key,
    required this.status,
  });

  String get text {
    switch (status) {
      case PackageStatus.processing:
        return 'Processing';
      case PackageStatus.inTransit:
        return 'In Transit';
      case PackageStatus.outForDelivery:
        return 'Out for Delivery';
      case PackageStatus.delivered:
        return 'Delivered';
    }
  }

  Color get color {
    switch (status) {
      case PackageStatus.processing:
        return AppColors.orange;
      case PackageStatus.inTransit:
        return AppColors.blue;
      case PackageStatus.outForDelivery:
        return AppColors.primary;
      case PackageStatus.delivered:
        return AppColors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 8,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
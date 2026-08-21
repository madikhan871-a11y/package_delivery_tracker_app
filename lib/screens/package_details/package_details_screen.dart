import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../models/package.dart';
import '../../widgets/status_badge.dart';
import '../../widgets/tracking_step.dart';

class PackageDetailsScreen extends StatelessWidget {
  final PackageItem package;

  const PackageDetailsScreen({
    super.key,
    required this.package,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Package Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.navy,
              borderRadius: BorderRadius.circular(23),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.inventory_2_rounded,
                  color: AppColors.primary,
                  size: 42,
                ),
                const SizedBox(height: 12),
                Text(
                  package.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  package.trackingNumber,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 9,
                  ),
                ),
                const SizedBox(height: 14),
                StatusBadge(
                  status: package.status,
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Package Information',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          _infoCard(),
          const SizedBox(height: 25),
          const Text(
            'Tracking History',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 15),
          const TrackingStep(
            title: 'Out for delivery',
            subtitle:
            'Courier has your package',
            time: 'Today',
            completed: false,
            active: true,
            isLast: false,
          ),
          const TrackingStep(
            title: 'Arrived at delivery hub',
            subtitle:
            'Package reached Vehari',
            time: 'Yesterday',
            completed: true,
            active: false,
            isLast: false,
          ),
          const TrackingStep(
            title: 'Package in transit',
            subtitle:
            'Package departed Multan',
            time: 'Aug 19',
            completed: true,
            active: false,
            isLast: false,
          ),
          const TrackingStep(
            title: 'Package picked up',
            subtitle:
            'Package collected from sender',
            time: 'Aug 18',
            completed: true,
            active: false,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _infoCard() {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        children: [
          _row('Sender', package.sender),
          _row('Receiver', package.receiver),
          _row('From', package.origin),
          _row('Destination', package.destination),
          _row('Weight', package.weight),
          _row(
            'Estimated',
            package.estimatedDate,
          ),
        ],
      ),
    );
  }

  Widget _row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 13,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 9,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 9,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
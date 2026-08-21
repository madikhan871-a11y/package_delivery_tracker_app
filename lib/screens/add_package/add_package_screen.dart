import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class AddPackageScreen extends StatefulWidget {
  const AddPackageScreen({super.key});

  @override
  State<AddPackageScreen> createState() =>
      _AddPackageScreenState();
}

class _AddPackageScreenState
    extends State<AddPackageScreen> {
  final trackingController =
  TextEditingController();
  final titleController =
  TextEditingController();
  final senderController =
  TextEditingController();

  @override
  void dispose() {
    trackingController.dispose();
    titleController.dispose();
    senderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Package',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Track a new package',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 21,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Enter the package information below.',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 9,
            ),
          ),
          const SizedBox(height: 25),
          _field(
            'Tracking Number',
            'e.g. PKG-842917',
            trackingController,
          ),
          _field(
            'Package Name',
            'e.g. Wireless Headphones',
            titleController,
          ),
          _field(
            'Sender',
            'e.g. Tech Store',
            senderController,
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(
                alpha: .06,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  color: AppColors.primary,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Make sure your tracking number is correct.',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 9,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Start Tracking',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _field(
      String label,
      String hint,
      TextEditingController controller,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}
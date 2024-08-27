import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(2.5),
              decoration: const BoxDecoration(
                color: AppColors.kPrimaryColor,
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(
                  'assets/images/profile_null.png',
                ),
              ),
            ),
            const Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Icon(
                Icons.arrow_drop_down,
                color: AppColors.kPrimaryColor,
                size: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

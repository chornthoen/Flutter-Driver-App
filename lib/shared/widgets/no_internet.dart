import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../colors/app_colors.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({
    super.key,
    this.height = 0.25,
  });
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * height!,
          ),
          Lottie.asset(
            'assets/images/animation_internet.json',
            height: 120,
            width: 160,
            alignment: Alignment.center,
          ),
          Text(
            'No internet connection!',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.tColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.tColor,
          ),
    );
  }
}

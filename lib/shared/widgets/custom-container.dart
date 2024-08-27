import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.child,
    this.color = AppColors.kPrimaryColor,
    this.horizontal = 0,
    this.vertical = 12,
  });

  final Widget? child;
  final Color? color;
  final double? horizontal;
  final double? vertical;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontal!,
        vertical: vertical!,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.kColorWhite,
        border: Border.all(color: color!.withOpacity(0.4)),
      ),
      child: child,
    );
  }
}

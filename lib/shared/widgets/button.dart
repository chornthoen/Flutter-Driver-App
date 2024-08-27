import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class ButtonAction extends StatelessWidget {
  const ButtonAction({
    super.key,
    required this.text,
    this.onPressed,
    this.color = AppColors.kPrimaryColor,
    this.width = double.infinity,
    this.height = 56,
    this.icon,
  });
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final double? width;
  final double? height;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width, 30),
          padding: EdgeInsets.symmetric(vertical: 10),
          elevation: 0,
          backgroundColor: color,
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                color: AppColors.kColorWhite,
                size: 20,
              ),
            if (icon != null) SizedBox(width: 5),
            Text(
              text,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kColorWhite,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors/app_colors.dart';

class ButtonOutLineAction extends StatelessWidget {
  const ButtonOutLineAction({
    super.key,
    this.text = " ",
    this.onPressed,
    this.width = double.infinity,
    this.height = 56,
    this.color = AppColors.kPrimaryColor,
    this.icon,
  });

  final String? text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: color,
          side: BorderSide(
            color: color!,
            width: 1,
          ),
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
                color: color,
                size: 20,
              ),
            if (icon != null) SizedBox(width: 5),
            Text(
              text!,
              style: TextStyle(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonIcon extends StatefulWidget {
  const ButtonIcon({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  State<ButtonIcon> createState() => _ButtonIconState();
}

class _ButtonIconState extends State<ButtonIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: OutlinedButton(
        onPressed: widget.onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: AppColors.kPrimaryColor,
          ),
          foregroundColor: AppColors.kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: SvgPicture.asset(
          'assets/svg/ri_direction.svg',
          width: 26,
        ),
      ),
    );
  }
}

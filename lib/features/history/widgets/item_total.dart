import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:driver_flutter/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ItemTotal extends StatelessWidget {
  const ItemTotal({
    required this.title,
    required this.price,
    super.key,
    this.color = AppColors.kColorBlack,
  });

  final String title;
  final String price;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            title,
            style: context.textTheme.titleSmall!.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Text(
            price,
            style: context.textTheme.titleSmall!.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

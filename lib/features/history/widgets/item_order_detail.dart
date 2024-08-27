import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:driver_flutter/shared/spacing/app_spacing.dart';
import 'package:driver_flutter/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ItemOrderDetail extends StatelessWidget {
  const ItemOrderDetail({
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.description,
    super.key,
  });

  final String image;
  final String name;
  final String price;
  final String quantity;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: AppSpacing.sm,
        horizontal: AppSpacing.md,
      ),
      child: Row(
        children: [
          Flexible(
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.kColorWhite,
                    borderRadius: BorderRadius.circular(AppSpacing.sm),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://cdn-iibnp.nitrocdn.com/VjyilAmBtWmZaLojjwWFayaMdinRRPlg/assets/images/optimized/rev-7ebe8ff/www.ourfriday.co.uk/image/cache/catalog/Apple/apple-iphone-15-uk-black-1-2-800x800w.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: context.textTheme.titleMedium!.copyWith(
                          color: AppColors.kColorBlack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        description,
                        style: context.textTheme.labelMedium!.copyWith(
                          color: AppColors.kColorGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$$price',
                style: context.textTheme.titleSmall!.copyWith(
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'x$quantity',
                style: context.textTheme.labelLarge!.copyWith(
                  color: AppColors.kColorBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemAndCode extends StatelessWidget {
  const ItemAndCode({
    required this.item,
    required this.code,
    super.key,
  });

  final String item;
  final String code;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Items'.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.kColorWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/pickup.svg',
                    width: 26,
                    height: 26,
                    color: AppColors.kColorWhite,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    item,
                    style: const TextStyle(
                      color: AppColors.kColorWhite,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Order Code',
                style: TextStyle(
                  color: AppColors.kColorWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                code,
                style: const TextStyle(
                  color: AppColors.kColorWhite,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

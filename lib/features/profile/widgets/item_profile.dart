import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:driver_flutter/shared/spacing/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemProfile extends StatelessWidget {
  const ItemProfile({
    required this.title,
    required this.icon,
    super.key,
    this.onTap,
    this.child,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.kColorWhite,
        boxShadow: [
          AppColors.kBoxShadowColor2,
        ],
      ),
      child: ListTile(
        selectedColor: AppColors.kColorWhite,
        focusColor: AppColors.kColorWhite,
        hoverColor: AppColors.kColorWhite,
        minVerticalPadding: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        onTap: onTap,
        title: Row(
          children: [
            Icon(
              icon,
              size: AppSpacing.xlg,
              color: AppColors.kPrimaryColor,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.kColorBlack,
              ),
            ),
            const Spacer(),
            if (child != null) child!,
            if (child == null)
              const Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: AppColors.kPrimaryColor,
              ),
          ],
        ),
      ),
    );
  }
}

class ItemPro {

  ItemPro({required this.title, required this.svg});
  String title;
  String svg;
}

final List<ItemPro> listPro = [
  ItemPro(title: 'Edit Profile', svg: 'assets/svg/edits.svg'),
  ItemPro(title: 'Support', svg: 'assets/svg/headset.svg'),
  ItemPro(title: 'Change Language', svg: 'assets/svg/language.svg'),
  ItemPro(title: 'Change Password', svg: 'assets/svg/lock.svg'),
  ItemPro(title: 'Settings', svg: 'assets/svg/settings.svg'),
  ItemPro(title: 'Help', svg: 'assets/svg/help.svg'),
];

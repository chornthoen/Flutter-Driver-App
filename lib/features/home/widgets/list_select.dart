import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListSelect extends StatelessWidget {
  const ListSelect({
    required this.onPressed,
    required this.title,
    required this.svg,
    required this.isSelected,
    super.key,
  });

  final VoidCallback onPressed;
  final String title;
  final String svg;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.only(left: 10),
      onTap: () {
        Navigator.pop(context);
        onPressed();
      },
      title: Row(
        children: [
          SvgPicture.asset(
            svg,
            width: 30,
            height: 30,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.kColorBlack,
            ),
          ),
          const Spacer(),
          Icon(
            isSelected
                ? PhosphorIcons.check_circle_fill
                : PhosphorIcons.circle_bold,
            color: AppColors.kPrimaryColor,
            size: 24,
          )
        ],
      ),
    );
  }
}

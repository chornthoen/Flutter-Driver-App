import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    super.key,
    this.title = '',
    this.onTab,
    this.textAction,
    this.centerTitle = false,
    this.onTabBack,
  });

  final String? title;
  final VoidCallback? onTab;
  final String? textAction;
  final bool? centerTitle;
  final VoidCallback? onTabBack;

  @override
  Size get preferredSize => const Size.fromHeight(68);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
      elevation: 0,
      toolbarHeight: 68,
      leadingWidth: 50,
      centerTitle: centerTitle,
      leading: IconButton(
        splashRadius: 20,
        onPressed: () {
          if (onTabBack != null) {
            onTabBack!();
          } else {
            Navigator.pop(context);
          }
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.kColorWhite,
          size: 24,
        ),
      ),
      title: Text(
        title!,
        style: const TextStyle(
          color: AppColors.kColorWhite,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        if (textAction != null)
          Container(
            height: 36,
            margin: const EdgeInsets.only(right: 18, top: 10, bottom: 10),
            child: OutlinedButton(
              onPressed: onTab,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.kColorWhite,
                side: const BorderSide(
                  color: AppColors.kColorWhite,
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    textAction == 'Map'
                        ? 'assets/svg/map.svg'
                        : 'assets/svg/list.svg',
                    width: 24,
                    height: 24,
                    color: AppColors.kColorWhite,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    textAction!,
                    style: const TextStyle(
                      color: AppColors.kColorWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 4),
                  SvgPicture.asset(
                    'assets/svg/paused.svg',
                    width: 16,
                    height: 16,
                    color: AppColors.kColorWhite,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

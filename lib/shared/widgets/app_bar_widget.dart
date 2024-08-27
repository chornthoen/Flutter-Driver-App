import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.kBackground,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          splashRadius: 20,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.kColorBlack,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.kColorBlack,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

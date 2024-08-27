import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class TabbarWidget extends StatefulWidget {
  const TabbarWidget({super.key, required this.tab, required this.onCheck});

  final bool onCheck;

  @override
  State<TabbarWidget> createState() => _TabbarWidgetState();

  final List<Widget> tab;
}

class _TabbarWidgetState extends State<TabbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: widget.onCheck == true
            ? const Border(
                top: BorderSide(color: AppColors.kColorLightGrey, width: 5),
                bottom: BorderSide(color: AppColors.kColorLightGrey, width: 5))
            : const Border(
                bottom: BorderSide(
                  color: AppColors.kColorBlack,
                  width: 1,
                ),
              ),
        color: AppColors.kColorWhite,
      ),
      child: TabBar(
        automaticIndicatorColorAdjustment: true,
        isScrollable: true,
        indicatorWeight: 2,
        indicatorPadding: const EdgeInsets.all(2),
        labelColor: AppColors.kPrimaryColor,
        unselectedLabelColor: AppColors.bColorGrey,
        indicatorColor: AppColors.kPrimaryColor,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: widget.tab,
      ),
    );
  }
}

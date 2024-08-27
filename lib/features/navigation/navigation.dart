import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class Navigation extends StatefulWidget {
  const Navigation({
    required this.tabController,
    super.key,
  });

  final TabController tabController;

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int tabController = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            onTap: (index) {
              setState(() {
                tabController = index;
                if (tabController == 0) {
                  widget.tabController.animateTo(0);
                } else if (tabController == 1) {
                  widget.tabController.animateTo(1);
                } else if (tabController == 2) {
                  widget.tabController.animateTo(2);
                } else if (tabController == 3) {
                  widget.tabController.animateTo(3);
                }
              });
            },
            indicatorSize: TabBarIndicatorSize.label,
            indicator: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.kPrimaryColor,
                  width: 2,
                ),
              ),
            ),
            labelColor: AppColors.kPrimaryColor,
            controller: widget.tabController,
            unselectedLabelColor: AppColors.kColorGrey,
            tabs: [
              buildItem(PhosphorIcons.house, 'ទំព័រដើម', 0),
              buildItem(PhosphorIcons.clock_counter_clockwise, 'ប្រវត្តិ', 1),
              buildItem(PhosphorIcons.bell, 'ជូនដំណឹង', 2),
              buildItem(PhosphorIcons.user_circle, 'ប្រវត្តិរូប', 3),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildItem(IconData icon, String text, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, top: 6),
      child: Column(
        children: [
          Stack(
            children: [
              Icon(
                icon,
                size: 28,
              ),
              if (index == 2)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: AppColors.kColorRed,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: const Text(
                      '2',
                      style: TextStyle(
                        color: AppColors.kColorWhite,
                        fontSize: 11,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:driver_flutter/data/model/history_model.dart';
import 'package:driver_flutter/features/history/views/history_detail_view.dart';
import 'package:driver_flutter/features/home/view/drop_off_view.dart';
import 'package:driver_flutter/features/home/view/pick_up-view.dart';
import 'package:driver_flutter/features/home/widgets/action_see_all.dart';
import 'package:driver_flutter/features/home/widgets/item_history.dart';
import 'package:driver_flutter/features/home/widgets/widget_action.dart';
import 'package:driver_flutter/features/main/view/main_view.dart';
import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:driver_flutter/shared/spacing/app_spacing.dart';
import 'package:driver_flutter/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const routePath = '/home_view';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 10,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            decoration: const BoxDecoration(
              color: AppColors.kPrimaryColor,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tabController.animateTo(3);
                        });
                      },
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.kColorWhite,
                        backgroundImage: AssetImage(
                          'assets/images/profile_null.png',
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mr. Driver',
                          style: context.textTheme.titleMedium!.copyWith(
                            color: AppColors.kColorWhite,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: AppSpacing.xs),
                        Text(
                          '#004444',
                          style: context.textTheme.titleSmall!.copyWith(
                            color: AppColors.kColorWhite,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: AppSpacing.xlg),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WidgetAction(
                      image: 'assets/images/pickup.png',
                      title: 'Pick up',
                      status: '5',
                      onTap: () {
                        context.push(PickupView.routePath);
                      },
                    ),
                    WidgetAction(
                      image: 'assets/images/dropoff.png',
                      title: 'Drop off',
                      status: '3',
                      onTap: () {
                        context.push(DropOffView.routePath);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          ActionSeeAll(
            onPressed: () {
              setState(() {
                tabController.animateTo(1);
              });
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: listHistory.length,
                      itemBuilder: (context, index) {
                        return ItemHistory(
                          image: listHistory[index].image,
                          name: listHistory[index].name,
                          code: listHistory[index].code,
                          status: listHistory[index].status,
                          date: listHistory[index].date,
                          phone: listHistory[index].phone,
                          payment: listHistory[index].payment,
                          total: listHistory[index].total,
                          onTap: () {
                            context.push(
                              HistoryDetailView.routePath,
                              extra: listHistory[index].status,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:driver_flutter/features/history/views/history_view.dart';
import 'package:driver_flutter/features/home/view/home_view.dart';
import 'package:driver_flutter/features/navigation/navigation.dart';
import 'package:driver_flutter/features/notifications/views/notification_view.dart';
import 'package:driver_flutter/features/profile/views/profile_view.dart';
import 'package:flutter/material.dart';

late TabController tabController;

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routePath = '/main';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeView(),
          HistoryView(),
          NotificationView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: Navigation(tabController: tabController),
    );
  }
}

import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:driver_flutter/features/history/widgets/tab_completed.dart';
import 'package:driver_flutter/features/history/widgets/tab_problem.dart';
import 'package:driver_flutter/features/history/widgets/tab_processing.dart';
import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  static const routePath = '/history';

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  DateTime? startDate;
  DateTime? endDate;

  DateFormat dateFormat = DateFormat('dd-MM-yyyy');

  void dateRangePicker() {
    showCustomDateRangePicker(
      context,
      dismissible: true,
      minimumDate: DateTime.now().subtract(const Duration(days: 60)),
      maximumDate: DateTime.now().add(const Duration(days: 30)),
      endDate: endDate,
      startDate: startDate,
      backgroundColor: AppColors.kBackground,
      primaryColor: AppColors.kPrimaryColor,
      onApplyClick: (start, end) {
        setState(() {
          endDate = end;
          startDate = start;
          print('----------------------------${dateFormat.format(startDate!)}');
          print('----------------------------${dateFormat.format(endDate!)}');
        });
      },
      onCancelClick: () {
        setState(() {
          endDate = null;
          startDate = null;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: AppBar(
        elevation: 0,
        title: const Text('History'),
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          TextButton.icon(
            onPressed: dateRangePicker,
            icon: const Icon(
              PhosphorIconsRegular.slidersHorizontal,
              color: AppColors.kColorWhite,
              size: 24,
            ),
            label: const Text(
              'Filter',
              style: TextStyle(
                color: AppColors.kColorWhite,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            padding: const EdgeInsets.all(2),
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.kColorWhite,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.kPrimaryColor),
            ),
            child: TabBar(
              controller: tabController,
              indicator: BoxDecoration(
                color: AppColors.kPrimaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              labelColor: AppColors.kColorWhite,
              unselectedLabelColor: AppColors.kColorBlack,
              labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.kColorWhite,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.kColorBlack,
              ),
              tabs: const [
                Tab(text: 'Processing'),
                Tab(text: 'Canceled'),
                Tab(text: 'Completed'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                TabProcessing(),
                TabProblem(),
                TabCompleted(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

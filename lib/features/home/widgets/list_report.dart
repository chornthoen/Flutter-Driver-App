import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ListReport extends StatefulWidget {
  const ListReport({super.key});

  @override
  State<ListReport> createState() => _ListReportState();
}

class _ListReportState extends State<ListReport> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          reportList.length,
          (index) => ItemReport(
            title: reportList[index].title,
            value: reportList[index].value!,
            onTap: () {
              setState(() {
                reportList[index].value = !reportList[index].value!;
              });
            },
            onTap1: (value) {
              setState(() {
                reportList[index].value = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

class ListReason extends StatefulWidget {
  const ListReason({super.key});

  @override
  State<ListReason> createState() => _ListReasonState();
}

class _ListReasonState extends State<ListReason> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          reason.length,
          (index) => ItemReport(
            title: reason[index].title,
            value: reason[index].value!,
            onTap: () {
              setState(() {
                reason[index].value = !reason[index].value!;
              });
            },
            onTap1: (value) {
              setState(() {
                reason[index].value = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

class ItemReport extends StatelessWidget {
  const ItemReport({
    super.key,
    required this.title,
    required this.value,
    required this.onTap,
    required this.onTap1,
  });

  final String title;
  final bool value;
  final Function(bool?) onTap1;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.kColorBlack,
          ),
        ),
        onTap: onTap,
        trailing: Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          value: value,
          onChanged: onTap1,
          activeColor: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}

class ReportModel {
  final String title;
  bool? value;

  ReportModel({required this.title, this.value});
}

final List<ReportModel> reportList = [
  ReportModel(title: 'Customer return items', value: false),
  ReportModel(title: 'customer not pick up items', value: false),
  ReportModel(title: 'Customer not pick up call', value: false),
  ReportModel(title: 'wait customer too long', value: false),
];

final List<ReportModel> reason = [
  ReportModel(title: 'Distance is too far', value: false),
  ReportModel(title: 'Store is not in my starting point', value: false),
  ReportModel(title: 'I don’t want to go to this store', value: false),
  ReportModel(title: 'I have too many orders', value: false),
];

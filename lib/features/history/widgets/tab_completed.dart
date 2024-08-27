import 'package:driver_flutter/data/model/history_model.dart';
import 'package:driver_flutter/features/history/views/history_detail_view.dart';
import 'package:driver_flutter/features/home/widgets/item_history.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabCompleted extends StatelessWidget {
  const TabCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: completedList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemBuilder: (context, index) {
        final completed = completedList[index];
        return ItemHistory(
          image: completed.image,
          name: completed.name,
          code: completed.code,
          status: completed.status,
          date: completed.date,
          phone: completed.phone,
          payment: completed.payment,
          total: completed.total,
          onTap: () {
            context.push(
              HistoryDetailView.routePath,
              extra: completed.status,
            );
          },
        );
      },
    );
  }
}

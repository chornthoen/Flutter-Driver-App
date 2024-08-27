import 'package:driver_flutter/data/model/history_model.dart';
import 'package:driver_flutter/features/history/views/history_detail_view.dart';
import 'package:driver_flutter/features/home/widgets/item_history.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabProcessing extends StatelessWidget {
  const TabProcessing({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: processingList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemBuilder: (context, index) {
        final processing = processingList[index];
        return ItemHistory(
          image: processing.image,
          name: processing.name,
          code: processing.code,
          status: processing.status,
          date: processing.date,
          phone: processing.phone,
          payment: processing.payment,
          total: processing.total,
          onTap: () {
            context.push(
              HistoryDetailView.routePath,
              extra: processing.status,
            );
          },
        );
      },
    );
  }
}

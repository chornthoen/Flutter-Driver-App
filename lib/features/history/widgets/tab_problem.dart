import 'package:driver_flutter/data/model/history_model.dart';
import 'package:driver_flutter/features/history/views/history_detail_view.dart';
import 'package:driver_flutter/features/home/widgets/item_history.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabProblem extends StatelessWidget {
  const TabProblem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: problemList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemBuilder: (context, index) {
        final problem = problemList[index];
        return ItemHistory(
          image: problem.image,
          name: problem.name,
          code: problem.code,
          status: problem.status,
          date: problem.date,
          phone: problem.phone,
          payment: problem.payment,
          total: problem.total,
          onTap: () {
            context.push(
              HistoryDetailView.routePath,
              extra: problem.status,
            );
          },
        );
      },
    );
  }
}

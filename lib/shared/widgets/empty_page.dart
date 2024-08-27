import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class EmptyData extends StatelessWidget {
  const EmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
          'assets/animations/no_notification.json',
          height: 160,
          width: 160,
        ),
        Text('No data',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}

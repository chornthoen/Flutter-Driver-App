import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidget extends StatelessWidget {
  LottieWidget({
    super.key,
    this.path,
    this.text,
    this.height = 0.15,
  });
  final String? path;
  final String? text;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * height!),
        Center(
          child: Lottie.asset(
            path!,
            height: 130,
            width: 160,
            alignment: Alignment.center,
          ),
        ),
        Text(
          text!,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

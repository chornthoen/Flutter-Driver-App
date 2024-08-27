import 'package:another_flushbar/flushbar.dart';
import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';

class SnackBarTop {
  static void topDeleteSuccess(BuildContext context, String message) {
    Flushbar<void>(
      messageText: Row(
        children: [
          // Image(
          //   image: AssetImage('assets/images/tick.png'),
          //   width: 40,
          //   height: 30,
          // ),
          // SizedBox(width: 5),
          Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 2),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: AppColors.kPrimaryColor.withOpacity(0.8),
      barBlur: 1,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
    ).show(context);
  }

  static void topDeleteError(BuildContext context, String message) {
    Flushbar<void>(
      messageText: Row(
        children: [
          // Image(
          //   image: AssetImage('assets/images/error.png'),
          //   width: 40,
          //   height: 30,
          // ),
          const SizedBox(width: 5),
          Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 2),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: AppColors.kColorRed.withOpacity(0.8),
      barBlur: 1,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
    ).show(context);
  }
}

class Snackbar extends StatelessWidget {
  const Snackbar({
    super.key,
    this.imagePath,
    this.title,
  });

  final String? imagePath;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image(
            image: AssetImage(imagePath!),
            width: 36,
            height: 36,
          ),
          const SizedBox(width: 3),
          Text(
            title!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

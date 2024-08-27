import 'package:dotted_line/dotted_line.dart';
import 'package:driver_flutter/features/home/widgets/text_labe.dart';
import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemHistory extends StatelessWidget {
  const ItemHistory({
    required this.image,
    required this.name,
    required this.code,
    required this.status,
    required this.date,
    required this.phone,
    required this.payment,
    required this.total,
    super.key,
    this.onTap,
  });

  final String image;
  final String name;
  final String code;
  final String status;
  final String date;
  final String phone;
  final String payment;
  final String total;
  final VoidCallback? onTap;

  Color colorStatus() {
    if (status == 'Completed') {
      return AppColors.kPrimaryColor;
    } else if (status == 'Canceled') {
      return AppColors.kColorRed;
    } else {
      return AppColors.kColorOrange;
    }
  }

  Color colorStatus1() {
    if (status == 'Completed') {
      return AppColors.kPrimaryColor.withOpacity(0.2);
    } else if (status == 'Canceled') {
      return AppColors.kColorRed.withOpacity(0.2);
    } else {
      return AppColors.kColorOrange.withOpacity(0.2);
    }
  }

  String imageStatus() {
    if (status == 'Completed') {
      return 'assets/svg/return_icon.svg';
    } else if (status == 'Canceled') {
      return 'assets/svg/cancel_icon.svg';
    } else if (status == 'Processing') {
      return 'assets/svg/processing_icon.svg';
    } else {
      return 'assets/svg/return_icon.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: AppColors.kColorWhite,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: colorStatus1(),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.kColorWhite,
                        backgroundImage: AssetImage(image),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              color: AppColors.kColorBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            code,
                            style: const TextStyle(
                              color: AppColors.kColorGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          SvgPicture.asset(
                            imageStatus(),
                            width: 28,
                            height: 28,
                          ),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: colorStatus1(),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              status.toUpperCase(),
                              style: TextStyle(
                                color: colorStatus(),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                DottedLine(
                  dashColor: colorStatus(),
                  dashGapLength: 6,
                  dashLength: 6,
                  lineThickness: 1,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextLabel(text: 'Date'),
                          TextLabel(text: 'Phone Number'),
                          TextLabel(text: 'Pay by'),
                          TextLabel(text: 'Total'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextValue(text: date),
                          TextValue(text: phone),
                          TextValue(text: payment),
                          TextValue(text: total),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 2),
              ],
            ),
          ),
          Container(
            width: 6,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              color: colorStatus(),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ],
      ),
    );
  }
}

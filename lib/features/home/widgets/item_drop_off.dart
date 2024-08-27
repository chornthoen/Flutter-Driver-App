import 'package:dotted_line/dotted_line.dart';
import 'package:driver_flutter/features/home/widgets/action_header.dart';
import 'package:driver_flutter/features/home/widgets/action_map.dart';
import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:driver_flutter/shared/widgets/button.dart';
import 'package:driver_flutter/shared/widgets/button_outLine.dart';
import 'package:driver_flutter/shared/widgets/custom-container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

import '../../../shared/widgets/item_and_code.dart';

class ItemDropOff extends StatelessWidget {
  const ItemDropOff({
    required this.name,
    required this.image,
    required this.phone,
    required this.item,
    required this.code,
    required this.deliveryAddress,
    required this.dropOffLocation,
    super.key,
    this.onReport,
    this.onCall,
    this.onDropOff,
    this.onDirection,
  });

  final String name;
  final String image;
  final String phone;
  final String item;
  final String code;
  final String deliveryAddress;
  final String dropOffLocation;
  final VoidCallback? onReport;
  final VoidCallback? onCall;
  final VoidCallback? onDropOff;
  final VoidCallback? onDirection;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomContainer(
          vertical: 14,
          child: Column(
            children: [
              ActionHeader(
                image: image,
                name: name,
                onCall: onCall,
                phone: phone,
              ),
              const SizedBox(height: 16),
              DottedLine(
                dashColor: AppColors.kColorGrey.withOpacity(0.4),
                dashGapLength: 6,
                dashLength: 6,
                lineThickness: 1,
              ),
              const SizedBox(height: 16),
              ItemAndCode(item: item, code: code),
              const SizedBox(height: 10),
              ActionMap(
                deliveryAddress: deliveryAddress,
                dropOffLocation: dropOffLocation,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonIcon(
                    onPressed: onDirection,
                  ),
                  ButtonOutLineAction(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.3,
                    text: 'Report',
                    onPressed: onReport,
                    color: AppColors.kColorRed,
                    icon: PhosphorIcons.warning_octagon_bold,
                  ),
                  ButtonAction(
                    height: 46,
                    width: MediaQuery.of(context).size.width * 0.3,
                    text: 'Drop Off',
                    onPressed: onDropOff,
                    icon: PhosphorIcons.check_bold,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

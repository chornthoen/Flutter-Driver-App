import 'package:dotted_line/dotted_line.dart';
import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:driver_flutter/shared/spacing/app_spacing.dart';
import 'package:driver_flutter/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ActionMap extends StatelessWidget {
  const ActionMap({
    required this.deliveryAddress,
    required this.dropOffLocation,
    super.key,
  });

  final String deliveryAddress;
  final String dropOffLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Column(
            children: [
              Icon(
                PhosphorIconsRegular.mapPinLine,
                color: AppColors.kPrimaryColor,
                size: AppSpacing.xlg,
              ),
              Expanded(
                child: DottedLine(
                  direction: Axis.vertical,
                  lineThickness: 2,
                  dashLength: 6,
                  dashColor: AppColors.kColorGrey,
                ),
              ),
              Icon(
                PhosphorIconsRegular.mapPinArea,
                color: AppColors.kPrimaryColor,
                size: AppSpacing.xlg,
              ),
              SizedBox(height: AppSpacing.md)
            ],
          ),
          const SizedBox(width: AppSpacing.sm),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery Address',
                      style: context.textTheme.titleSmall!.copyWith(
                        color: AppColors.kColorGrey,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            deliveryAddress,
                            style: context.textTheme.labelLarge!.copyWith(
                              color: AppColors.kColorBlack,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Drop Off Location',
                      style: context.textTheme.titleSmall!.copyWith(
                        color: AppColors.kColorGrey,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            dropOffLocation,
                            style: context.textTheme.labelLarge!.copyWith(
                              color: AppColors.kColorBlack,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

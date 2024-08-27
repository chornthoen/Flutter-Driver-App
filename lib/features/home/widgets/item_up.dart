import 'package:dotted_line/dotted_line.dart';
import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:driver_flutter/shared/spacing/app_spacing.dart';
import 'package:driver_flutter/shared/theme/app_theme.dart';
import 'package:driver_flutter/shared/widgets/button.dart';
import 'package:driver_flutter/shared/widgets/button_outLine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ItemPickUp extends StatelessWidget {
  const ItemPickUp({
    required this.package,
    required this.location,
    required this.startLocation,
    required this.endLocation,
    required this.onDecline,
    required this.onAccept,
    super.key,
  });

  final String package;
  final String location;
  final String startLocation;
  final String endLocation;
  final VoidCallback onDecline;
  final VoidCallback onAccept;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
          margin: const EdgeInsets.only(bottom: AppSpacing.lg),
          decoration: BoxDecoration(
            color: AppColors.kColorWhite,
            borderRadius: BorderRadius.circular(AppSpacing.sm),
            border: Border.all(
              color: AppColors.kColorGrey.withOpacity(0.2),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Package'.toUpperCase(),
                          style: context.textTheme.titleMedium!.copyWith(
                            color: AppColors.kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/pickup.svg',
                              color: AppColors.kPrimaryColor,
                              width: AppSpacing.xlg + 4,
                            ),
                            const SizedBox(width: AppSpacing.xs),
                            Text(
                              package,
                              style: context.textTheme.titleLarge!.copyWith(
                                color: AppColors.kColorBlack,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: AppSpacing.sm,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.kColorWhite,
                        borderRadius: BorderRadius.circular(AppSpacing.sm),
                        border: Border.all(
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            PhosphorIconsFill.arrowUUpRight,
                            color: AppColors.kPrimaryColor,
                            size: AppSpacing.xlg,
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          Text(
                            '$startLocation, $endLocation',
                            style: context.textTheme.labelMedium!.copyWith(
                              color: AppColors.kColorBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              DottedLine(
                dashColor: AppColors.kColorGrey.withOpacity(0.4),
                dashGapLength: 6,
                dashLength: 6,
              ),
              const SizedBox(height: AppSpacing.lg),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      PhosphorIconsRegular.mapPinLine,
                      color: AppColors.kPrimaryColor,
                      size: AppSpacing.xlg,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Store Location',
                            style: context.textTheme.titleSmall!.copyWith(
                              color: AppColors.kPrimaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            location,
                            style: context.textTheme.labelMedium!.copyWith(
                              color: AppColors.kColorBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonOutLineAction(
                    color: AppColors.kColorRed,
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.3,
                    text: 'Decline',
                    onPressed: onDecline,
                  ),
                  ButtonAction(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.3,
                    text: 'Accept',
                    onPressed: onAccept,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:driver_flutter/shared/spacing/app_spacing.dart';
import 'package:driver_flutter/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ActionHeader extends StatelessWidget {
  const ActionHeader({
    required this.image,
    required this.name,
    required this.onCall,
    required this.phone,
    super.key,
  });

  final String image;
  final String name;
  final VoidCallback? onCall;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.kColorWhite,
            backgroundImage: AssetImage(image),
            radius: AppSpacing.xlg,
          ),
          const SizedBox(width: AppSpacing.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: context.textTheme.titleMedium!.copyWith(
                  color: AppColors.kColorBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Customer',
                style: context.textTheme.titleSmall!.copyWith(
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 36,
            child: OutlinedButton(
              onPressed: () async {
                onCall?.call();
                final phoneLaunchUri = Uri(
                  scheme: 'tel',
                  path: phone,
                );
                await launchUrl(phoneLaunchUri);
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                side: const BorderSide(
                  color: AppColors.kPrimaryColor,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.sm),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.call,
                    color: AppColors.kPrimaryColor,
                    size: AppSpacing.xlg,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    phone,
                    style: context.textTheme.titleSmall!.copyWith(
                      color: AppColors.kPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

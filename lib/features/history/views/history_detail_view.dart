import 'package:dotted_line/dotted_line.dart';
import 'package:driver_flutter/features/history/widgets/item_order_detail.dart';
import 'package:driver_flutter/features/history/widgets/item_total.dart';
import 'package:driver_flutter/features/home/widgets/action_header.dart';
import 'package:driver_flutter/features/home/widgets/action_map.dart';
import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:driver_flutter/shared/spacing/app_spacing.dart';
import 'package:driver_flutter/shared/theme/app_theme.dart';
import 'package:driver_flutter/shared/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';

class HistoryDetailView extends StatefulWidget {
  const HistoryDetailView({
    required this.status,
    super.key,
  });

  final String status;

  static const routePath = '/history-detail';

  @override
  State<HistoryDetailView> createState() => _HistoryDetailViewState();
}

class _HistoryDetailViewState extends State<HistoryDetailView> {
  Color colorStatus() {
    if (widget.status == 'Completed') {
      return AppColors.kPrimaryColor;
    } else if (widget.status == 'Canceled') {
      return AppColors.kColorRed;
    } else {
      return AppColors.kColorOrange;
    }
  }

  Color colorStatus1() {
    if (widget.status == 'Completed') {
      return AppColors.kPrimaryColor.withOpacity(0.3);
    } else if (widget.status == 'Canceled') {
      return AppColors.kColorRed.withOpacity(0.3);
    } else {
      return AppColors.kColorOrange.withOpacity(0.3);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: const AppBarCustom(title: 'History Detail'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            children: [
              const SizedBox(height: AppSpacing.lg),
              Container(
                padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSpacing.md),
                  border: Border.all(color: colorStatus1()),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.sm,
                        horizontal: AppSpacing.lg,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: colorStatus(),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(AppSpacing.md),
                          topRight: Radius.circular(AppSpacing.md),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            widget.status.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.kColorWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    ActionHeader(
                      image: 'assets/images/profile_null.png',
                      name: 'John Doe',
                      phone: '0123456789',
                      onCall: () {},
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    DottedLine(
                      dashColor: colorStatus1(),
                      dashGapLength: 6,
                      dashLength: 6,
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    const ActionMap(
                      deliveryAddress: '46 St 289, Sangkat, Phnom Penh ',
                      dropOffLocation: 'Sangkat Toek Laak III, Khan Tuol Kork,'
                          ' 42 Street 656, Phnom Penh 12158',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.md,
                  horizontal: AppSpacing.sm,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSpacing.md),
                  border: Border.all(color: colorStatus1()),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Items Order',
                      style: context.textTheme.titleMedium!.copyWith(
                        color: AppColors.kColorBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    const ItemOrderDetail(
                      image: 'https://via.placeholder.com/150',
                      name: 'Iphone 15',
                      price: r'1000.00$',
                      quantity: '2',
                      description: 'Memory: 256GB',
                    ),
                    const ItemOrderDetail(
                      image: 'https://via.placeholder.com/150',
                      name: 'Iphone 15',
                      price: r'1000.00$',
                      quantity: '2',
                      description: 'Memory: 256GB',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSpacing.md),
                  border: Border.all(color: colorStatus1()),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Payment',
                            style: context.textTheme.titleMedium!.copyWith(
                              color: AppColors.kColorBlack,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const ItemTotal(
                            title: 'Subtotal',
                            price: r'$10.00',
                          ),
                          const ItemTotal(
                            title: 'Delivery Fee',
                            price: r'$2.00',
                          ),
                          const ItemTotal(
                            title: 'VAT(10%)',
                            price: r'$1.00',
                          ),
                          const ItemTotal(
                            title: '10% off coupon',
                            price: r'-$1.00',
                            color: AppColors.kPrimaryColor,
                          ),
                          const ItemTotal(
                            title: 'Pay by',
                            price: 'Cash on delivery',
                          ),
                          const SizedBox(height: AppSpacing.sm),
                        ],
                      ),
                    ),
                    DottedLine(
                      dashColor: colorStatus1(),
                      dashGapLength: 6,
                      dashLength: 6,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                              vertical: AppSpacing.sm,
                            ),
                            child: Text(
                              'Grand Total',
                              style: context.textTheme.titleSmall!.copyWith(
                                color: AppColors.kColorBlack,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.md,
                            vertical: AppSpacing.sm,
                          ),
                          child: Text(
                            r'$13.50',
                            style: context.textTheme.titleSmall!.copyWith(
                              color: AppColors.kPrimaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xlg),
            ],
          ),
        ),
      ),
    );
  }
}

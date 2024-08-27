import 'package:dotted_line/dotted_line.dart';
import 'package:driver_flutter/features/history/widgets/item_order_detail.dart';
import 'package:driver_flutter/features/history/widgets/item_total.dart';
import 'package:driver_flutter/features/home/view/confirm_payment_view.dart';
import 'package:driver_flutter/features/home/widgets/action_header.dart';
import 'package:driver_flutter/features/home/widgets/action_map.dart';
import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:driver_flutter/shared/widgets/app_bar_custom.dart';
import 'package:driver_flutter/shared/widgets/button.dart';
import 'package:driver_flutter/shared/widgets/custom-container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DropOffDetailView extends StatefulWidget {
  const DropOffDetailView({super.key});

  static const routePath = '/drop-off-detail';

  @override
  State<DropOffDetailView> createState() => _DropOffDetailViewState();
}

class _DropOffDetailViewState extends State<DropOffDetailView> {
  late TextEditingController _reportController;

  @override
  void initState() {
    super.initState();
    _reportController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _reportController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: const AppBarCustom(title: 'Drop Off Detail'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              CustomContainer(
                color: AppColors.bColorGrey.withOpacity(0.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    ActionHeader(
                      image: 'assets/images/profile_null.png',
                      name: 'John Doe',
                      phone: '0123456789',
                      onCall: () {},
                    ),
                    const SizedBox(height: 16),
                    DottedLine(
                      dashColor: AppColors.kColorGrey.withOpacity(0.4),
                      dashGapLength: 6,
                      dashLength: 6,
                      lineThickness: 1,
                    ),
                    const SizedBox(height: 16),
                    const ActionMap(
                      deliveryAddress: '123, Street 1, Phnom Penh',
                      dropOffLocation: '123, Street 2, Phnom Penh',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              CustomContainer(
                color: AppColors.bColorGrey.withOpacity(0.4),
                horizontal: 12,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Items Order',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.kColorBlack,
                      ),
                    ),
                    SizedBox(height: 8),
                    ItemOrderDetail(
                      image: 'assets/images/item1.png',
                      name: 'Chicken Burger',
                      price: '5.00',
                      quantity: '2',
                      description: 'Cyberjaya, Selangor',
                    ),
                    ItemOrderDetail(
                      image: 'assets/images/item1.png',
                      name: 'Chicken Burger',
                      price: '5.00',
                      quantity: '2',
                      description: 'Cyberjaya, Selangor',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              CustomContainer(
                color: AppColors.bColorGrey.withOpacity(0.4),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Payment',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.kColorBlack,
                            ),
                          ),
                          ItemTotal(
                            title: 'Subtotal',
                            price: r'$10.00',
                          ),
                          ItemTotal(
                            title: 'Delivery Fee',
                            price: r'$2.00',
                          ),
                          ItemTotal(
                            title: 'VAT(10%)',
                            price: r'$1.00',
                          ),
                          ItemTotal(
                            title: '10% off coupon',
                            price: r'-$1.00',
                            color: AppColors.kPrimaryColor,
                          ),
                          ItemTotal(
                            title: 'Pay by',
                            price: 'Cash on delivery',
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                    DottedLine(
                      dashColor: AppColors.kColorGrey.withOpacity(0.4),
                      dashGapLength: 6,
                      dashLength: 6,
                      lineThickness: 1,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            child: Text(
                              'Grand Total',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.kColorBlack,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: Text(
                            r'$13.50',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ButtonAction(
                height: 50,
                text: 'Confirm',
                onPressed: () {
                  context.push(ConfirmPaymentView.routePath);
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

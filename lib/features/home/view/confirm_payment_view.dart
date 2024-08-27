import 'package:dotted_line/dotted_line.dart';
import 'package:driver_flutter/features/home/models/select_option_model.dart';
import 'package:driver_flutter/features/home/widgets/label_text.dart';
import 'package:driver_flutter/features/home/widgets/list_select.dart';
import 'package:driver_flutter/features/home/widgets/photo_of_recent.dart';
import 'package:driver_flutter/features/home/widgets/received_money.dart';
import 'package:driver_flutter/features/main/view/main_view.dart';
import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:driver_flutter/shared/widgets/app_bar_custom.dart';
import 'package:driver_flutter/shared/widgets/button.dart';
import 'package:driver_flutter/shared/widgets/custom-container.dart';
import 'package:driver_flutter/shared/widgets/show_dialog_widget.dart';
import 'package:driver_flutter/shared/widgets/snack_bar_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class ConfirmPaymentView extends StatefulWidget {
  const ConfirmPaymentView({super.key});

  static const routePath = '/confirm_payment_view';

  @override
  State<ConfirmPaymentView> createState() => _ConfirmPaymentViewState();
}

class _ConfirmPaymentViewState extends State<ConfirmPaymentView> {
  late TextEditingController selectOptionController;
  late TextEditingController khEditController;
  late TextEditingController usdEditController;

  @override
  void initState() {
    super.initState();
    selectOptionController = TextEditingController();
    khEditController = TextEditingController();
    usdEditController = TextEditingController();
  }

  @override
  void dispose() {
    selectOptionController.dispose();
    khEditController.dispose();
    usdEditController.dispose();
    super.dispose();
  }

  String sgv() {
    if (selectOptionController.text == 'ABA KHQR') {
      return 'assets/svg/khqr.svg';
    } else if (selectOptionController.text == 'Pay by Cash') {
      return 'assets/svg/riel.svg';
    }
    return 'assets/svg/payment.svg';
  }

  String getLottie() {
    if (selectOptionController.text.isEmpty) {
      return 'assets/animations/arrow_down.json';
    } else {
      return 'assets/animations/check.json';
    }
  }

  String getSvg(String title) {
    if (title == 'ABA KHQR') {
      return 'assets/svg/khqr.svg';
    } else {
      return 'assets/svg/riel.svg';
    }
  }

  void selectMethod() {
    ShowDialogWidget.showButtonSheetSelectOption(
      context: context,
      child: Column(
        children: [
          ...List.generate(
            listOption.length,
            (index) {
              final item = listOption[index].title;
              return ListSelect(
                onPressed: () {
                  setState(() {
                    selectOptionController.text = item;
                  });
                },
                title: item,
                svg: getSvg(item),
                isSelected: selectOptionController.text == item,
              );
            },
          ),
        ],
      ),
    );
  }

  void onSubmitPayByCash() {
    if (khEditController.text.trim().isEmpty) {
      SnackBarTop.topDeleteError(
        context,
        'Please enter the amount in Khmer Riel',
      );
    } else if (usdEditController.text.trim().isEmpty) {
      SnackBarTop.topDeleteError(context, 'Please enter the amount in USD');
    } else {
      onSubmit();
    }
  }

  void onSubmit() {
    ShowDialogWidget.showDialogPaymentSuccess(
      context: context,
      onPressed: () {
        context.push(MainView.routePath);
      },
      amount: r'$ 40.00',
      paidBy: 'Pay by Cash',
    );
  }

  void selectOption() {
    ShowDialogWidget.showDialogSelect(
      context: context,
      onPressed: () {
        context.pop();
      },
    );
  }

  Color colorSubmit() {
    if (selectOptionController.text.isNotEmpty) {
      return AppColors.kPrimaryColor;
    }
    return AppColors.kColorGrey.withOpacity(0.5);
  }

  bool get isKeyboardOpen => MediaQuery.of(context).viewInsets.bottom > 0;

  void closeKeyboard() {
    if (isKeyboardOpen) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: closeKeyboard,
      child: Scaffold(
        appBar: const AppBarCustom(title: 'ConfirmPayment'),
        backgroundColor: AppColors.kBackground,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LabelTextPay(label: 'Total Payment'),
                    const SizedBox(height: 10),
                    CustomContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Money(
                            text: 'Total in USD',
                            money: r'$ 12000',
                          ),
                          SvgPicture.asset(
                            'assets/svg/convert.svg',
                            width: 26,
                            height: 26,
                          ),
                          const Money(
                            text: 'Total in USD',
                            money: '៛ 48,000 000',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        LabelTextPay(label: 'Exchange Rate'),
                        Spacer(),
                        Text(
                          '1 USD = 4000 R',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.kColorGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const DottedLine(
                dashColor: AppColors.kPrimaryColor,
                dashGapLength: 6,
                dashLength: 6,
                lineThickness: 1,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: selectMethod,
                      child: TextFormField(
                        onChanged: (value) => setState(() {}),
                        enabled: false,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.kColorBlack,
                        ),
                        controller: selectOptionController,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 5),
                            child: SvgPicture.asset(
                              sgv(),
                              width: 20,
                              height: 40,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: selectMethod,
                            icon: Lottie.asset(
                              getLottie(),
                              width: 25,
                              height: 25,
                            ),
                          ),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 40,
                            minHeight: 40,
                            maxWidth: 55,
                          ),
                          hintText: 'Select Payment Option',
                          hintStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.kColorBlack,
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColors.kPrimaryColor,
                            ),
                          ),
                          fillColor: AppColors.kColorWhite,
                          filled: true,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: selectOptionController.text == 'ABA KHQR',
                      child: const PhotoOfRecept(),
                    ),
                    if (selectOptionController.text == 'Pay by Cash' ||
                        selectOptionController.text.isEmpty)
                      ReceivedMoney(
                        khmerMoney: khEditController,
                        usdMoney: usdEditController,
                        enable: selectOptionController.text.trim().isNotEmpty,
                        onPressed: selectOption,
                      ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          margin: const EdgeInsets.only(bottom: 30),
          child: ButtonAction(
            color: colorSubmit(),
            height: 48,
            text: 'Submit',
            onPressed: () {
              if (selectOptionController.text == 'ABA KHQR') {
                onSubmit();
              } else if (selectOptionController.text == 'Pay by Cash') {
                onSubmitPayByCash();
              }
            },
          ),
        ),
      ),
    );
  }
}

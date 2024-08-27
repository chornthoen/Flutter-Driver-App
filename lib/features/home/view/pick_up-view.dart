import 'package:driver_flutter/data/model/pick_up_model.dart';
import 'package:driver_flutter/features/home/view/drop_off_view.dart';
import 'package:driver_flutter/features/home/widgets/item_up.dart';
import 'package:driver_flutter/features/home/widgets/list_report.dart';
import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:driver_flutter/shared/widgets/app_bar_custom.dart';
import 'package:driver_flutter/shared/widgets/button.dart';
import 'package:driver_flutter/shared/widgets/button_outLine.dart';
import 'package:driver_flutter/shared/widgets/show_dialog_widget.dart';
import 'package:driver_flutter/shared/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PickupView extends StatefulWidget {
  const PickupView({super.key});

  static const routePath = '/pick-up-view';

  @override
  State<PickupView> createState() => _PickupViewState();
}

class _PickupViewState extends State<PickupView> {
  late TextEditingController _reasonController;

  @override
  void initState() {
    super.initState();
    _reasonController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _reasonController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: const AppBarCustom(title: 'Pick Up'),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: listPickUp.length,
        itemBuilder: (context, index) {
          return ItemPickUp(
            package: listPickUp[index].package,
            location: listPickUp[index].location,
            startLocation: listPickUp[index].startLocation,
            endLocation: listPickUp[index].endLocation,
            onAccept: () {
              ShowDialogWidget.showDialogAccept(
                context: context,
                okay: () {
                  context
                    ..push(DropOffView.routePath)
                    ..pop();
                },
              );
            },
            onDecline: _showDialog,
          );
        },
      ),
    );
  }

  void _showDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: AppColors.kBackground,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Reason',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.kColorBlack,
              ),
            ),
            const ListReason(),
            const Text(
              'Other',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.kColorBlack,
              ),
            ),
            const SizedBox(height: 10),
            TextFieldForms(
              hintText: 'Type here',
              maxLines: 2,
              controller: _reasonController,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonOutLineAction(
                  color: AppColors.kColorRed,
                  height: 48,
                  width: MediaQuery.of(context).size.width * 0.3,
                  text: 'Cancel',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 40),
                ButtonAction(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.3,
                  text: 'Submit',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

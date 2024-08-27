import 'package:driver_flutter/data/model/dropoff_model.dart';
import 'package:driver_flutter/features/home/view/drop_off_detail_view.dart';
import 'package:driver_flutter/features/home/widgets/item_drop_off.dart';
import 'package:driver_flutter/features/home/widgets/list_report.dart';
import 'package:driver_flutter/features/maps/views/map_view.dart';
import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:driver_flutter/shared/widgets/app_bar_custom.dart';
import 'package:driver_flutter/shared/widgets/button.dart';
import 'package:driver_flutter/shared/widgets/button_outLine.dart';
import 'package:driver_flutter/shared/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class DropOffView extends StatefulWidget {
  const DropOffView({super.key});

  static const routePath = '/drop-off-view';

  @override
  State<DropOffView> createState() => _DropOffViewState();
}

class _DropOffViewState extends State<DropOffView> {
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

  Future<void> openMap({required double lat, required double lng}) async {
    final googleUrl =
        'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng';

    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: AppBarCustom(
        title: 'Drop Off',
        textAction: 'Map',
        onTab: () {
          context.push(MapView.routePath);
        },
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemCount: listDropOff.length,
        itemBuilder: (context, index) {
          final item = listDropOff[index];
          return ItemDropOff(
            name: item.name,
            image: item.image,
            phone: item.phone,
            item: item.item,
            code: item.code,
            deliveryAddress: item.deliveryAddress,
            dropOffLocation: item.dropOffLocation,
            onCall: () {},
            onReport: _showDialog,
            onDirection: () {
              openMap(lat: 11.568613, lng: 104.893446);
              print('direction');
            },
            onDropOff: () {
              context.push(DropOffDetailView.routePath);
            },
          );
        },
      ),
    );
  }

  //function open map

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
              'Report',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.kColorBlack,
              ),
            ),
            const ListReport(),
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
              controller: _reportController,
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

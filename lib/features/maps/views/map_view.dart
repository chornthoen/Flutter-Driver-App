import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:driver_flutter/features/home/view/drop_off_detail_view.dart';
import 'package:driver_flutter/features/home/widgets/item_drop_off.dart';
import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:driver_flutter/shared/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  static const routePath = '/map';

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: const AppBarCustom(title: 'Maps'),
      body: Center(
        child: Column(
          children: [
            if (Platform.isAndroid) ...[
              const Expanded(
                child: MapWidget(),
              ),
            ] else if (Platform.isIOS) ...[
              const Expanded(
                child: Center(child: Text('Coming soon...')),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(11.5564, 104.9282),
    zoom: 15.4746,
  );

  final List<Marker> markers = [];

  List<LatLng> latlngSegment = [
    const LatLng(11.5535026, 104.924325),
    const LatLng(11.5552789, 104.92633),
    const LatLng(11.5553761, 104.9244446),
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    for (var i = 0; i < latlngSegment.length; i++) {
      final imageData =
          await loadNetworkImage('https://picsum.photos/250?image=9');

      final codec = await ui.instantiateImageCodec(
        imageData.buffer.asUint8List(),
        targetWidth: 100,
        targetHeight: 100,
      );
      final frameInfo = await codec.getNextFrame();
      final byteData = await frameInfo.image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      final uint8list = byteData!.buffer.asUint8List();

      markers.add(
        Marker(
          markerId: MarkerId('marker$i'),
          position: latlngSegment[i],
          infoWindow: InfoWindow(
            title: 'Sokha $i',
            snippet: 'St. 271, Phnom Penh',
          ),
          icon: BitmapDescriptor.fromBytes(uint8list),
          onTap: () => _showBottomSheet(context),
        ),
      );
    }
    //setState(() {});
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.kBackground,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Container(
              width: 40,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.kColorBlack.withOpacity(.2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: ItemDropOff(
                name: 'Sokha',
                image: 'assets/images/profile_null.png',
                phone: '069 997 502',
                item: '10',
                code: '#123456',
                deliveryAddress: 'St. 271, Phnom Penh',
                dropOffLocation: 'St. 271, Phnom Penh',
                onReport: () {},
                onDirection: () {},
                onDropOff: () {
                  context.push(DropOffDetailView.routePath);
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }

  Future<Uint8List> loadNetworkImage(String path) {
    final completer = Completer<Uint8List>();

    final config = const ImageConfiguration();

    final image = NetworkImage(path);

    image.resolve(config).addListener(
          ImageStreamListener(
            (info, _) => completer.complete(
              info.image.toByteData(format: ui.ImageByteFormat.png).then(
                    (byteData) => byteData!.buffer.asUint8List(),
                  ),
            ),
          ),
        );
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _kGooglePlex,
      mapType: MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      markers: Set<Marker>.of(markers),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}

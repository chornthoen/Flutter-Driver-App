import 'package:driver_flutter/features/home/view/drop_off_view.dart';
import 'package:driver_flutter/features/home/view/pick_up-view.dart';
import 'package:driver_flutter/features/notifications/widgets/get_fcm.dart';
import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  static const routePath = '/notification_view';

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    final token = await getFCMToken();
    print('----------------------------');
    print('FCM Token: $token');
    print('----------------------------');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: AppBar(
        title: const Text('Notification'),
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height * 0.07,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: listNotification.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        itemBuilder: (context, index) {
          final item = listNotification[index];
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            ),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: item.isRead!
                  ? AppColors.kPrimaryColor.withOpacity(0.1)
                  : AppColors.kColorWhite,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: item.isRead!
                    ? AppColors.kPrimaryColor.withOpacity(0.1)
                    : AppColors.kColorGrey.withOpacity(0.1),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  item.isRead = false;
                });
                if (item.title == 'Pick up') {
                  context.push(PickupView.routePath);
                } else {
                  context.push(DropOffView.routePath);
                }
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.kPrimaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image(
                            image: AssetImage(item.image),
                            height: 42,
                            width: 42,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.title,
                                    style: TextStyle(
                                      color: item.isRead!
                                          ? AppColors.kColorBlack
                                          : AppColors.bColorGrey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    item.time,
                                    style: TextStyle(
                                      color: item.isRead!
                                          ? AppColors.kColorBlack
                                          : AppColors.bColorGrey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                item.subTitle,
                                style: TextStyle(
                                  color: item.isRead!
                                      ? AppColors.kColorBlack
                                      : AppColors.bColorGrey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class NotificationModel {
  final String title;
  final String subTitle;
  final String time;
  final String image;
  bool? isRead;

  NotificationModel({
    required this.title,
    required this.subTitle,
    required this.time,
    required this.image,
    this.isRead,
  });
}

//list notification 6 items
final List<NotificationModel> listNotification = [
  NotificationModel(
    title: 'Drop off',
    subTitle: 'The driver has arrived at the drop off location',
    time: '2h ago',
    image: 'assets/images/dropoff.png',
    isRead: true,
  ),
  NotificationModel(
    title: 'Pick up',
    subTitle: 'The driver has arrived at the pick up location and is waiting '
        'for you',
    time: '2h ago',
    image: 'assets/images/pickup.png',
    isRead: true,
  ),
];

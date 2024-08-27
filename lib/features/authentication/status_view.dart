
import 'package:driver_flutter/features/main/view/main_view.dart';
import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:driver_flutter/shared/widgets/button.dart';
import 'package:driver_flutter/shared/widgets/button_outLine.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class StatusView extends StatefulWidget {
  const StatusView({super.key});

  static const routePath = '/status';

  @override
  State<StatusView> createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Lottie.asset(
              'assets/animations/status.json',
              // height: 200,
              // width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              'Enable Your Location',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.kPrimaryColor
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Enable your location to get the best experience of the'
                  ' app Layover.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.kColorGrey,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: value,
                  onChanged: (bool? newValue) {
                    setState(() {
                      value = newValue!;
                    });
                  },
                  splashRadius: 0.1,
                  activeColor: AppColors.kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Text(
                  'Agree to Terms and Condition',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kColorGrey,
                    decoration: TextDecoration.underline
                  ),
                ),
              ],
            ),
           Spacer(),
           ButtonAction(
             color: value == false ? AppColors.kColorGrey.withOpacity(.7) :
             AppColors.kPrimaryColor,
              text: 'Enable',
              onPressed: () {
               if(value == true) {
                 context.go(MainView.routePath);

               }
              },
            ),

             SizedBox(height: 20),
            ButtonOutLineAction(
              color: AppColors.kColorGrey,
              text: 'Deny',
              onPressed: () {
                context.go(MainView.routePath);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

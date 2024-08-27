import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:driver_flutter/shared/widgets/app_bar_custom.dart';
import 'package:driver_flutter/shared/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangeLanguageView extends StatefulWidget {
  const ChangeLanguageView({super.key});

  static const routePath = '/change-language';

  @override
  State<ChangeLanguageView> createState() => _ChangeLanguageViewState();
}

class _ChangeLanguageViewState extends State<ChangeLanguageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: const AppBarCustom(title: 'Change Language'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Card(
                  color: AppColors.kColorWhite,
                  child: ListTile(
                    selectedColor: AppColors.kColorWhite,
                    title: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/khmer.svg',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 5),
                        const Text('ភាសាខ្មែរ'),
                      ],
                    ),
                    onTap: () {},
                    trailing: const Icon(
                      Icons.check,
                      color: AppColors.kPrimaryColor,
                      size: 22,
                    ),
                  ),
                ),
                Card(
                  color: AppColors.kColorWhite,
                  child: ListTile(
                    selectedColor: AppColors.kColorWhite,
                    title: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/english.svg',
                          width: 22,
                          height: 22,
                        ),
                        const SizedBox(width: 5),
                        const Text('English'),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                const SizedBox(height: 40),
                ButtonAction(
                  text: 'Save',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

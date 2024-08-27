import 'package:driver_flutter/features/authentication/login/view/login_view.dart';
import 'package:driver_flutter/features/profile/views/change_language.dart';
import 'package:driver_flutter/features/profile/views/change_password_view.dart';
import 'package:driver_flutter/features/profile/views/edit_profile_view.dart';
import 'package:driver_flutter/features/profile/views/help_and_support_view.dart';
import 'package:driver_flutter/features/profile/widgets/item_profile.dart';
import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:driver_flutter/shared/spacing/app_spacing.dart';
import 'package:driver_flutter/shared/widgets/button.dart';
import 'package:driver_flutter/shared/widgets/show_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  static const routePath = '/profile';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool _isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: AppBar(
        elevation: 0,
        title: const Text('My Profile'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          child: Column(
            children: [
              const SizedBox(height: AppSpacing.xlg),
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.kColorWhite,
                  borderRadius: BorderRadius.circular(AppSpacing.sm),
                  boxShadow: [
                    AppColors.kBoxShadowColor1,
                    AppColors.kBoxShadowColor2
                  ],
                ),
                child: Row(
                  children: [
                    const Center(
                      child: CircleAvatar(
                        radius: 34,
                        backgroundColor: AppColors.kColorWhite,
                        backgroundImage: AssetImage(
                          'assets/images/profile_null.png',
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Mr. John Doe',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.kColorBlack,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        const Text(
                          '069 997 502',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.kColorGrey,
                          ),
                        ),
                        Text(
                          'Delivery',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: AppColors.kPrimaryColor,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xxxlg),
              ItemProfile(
                title: 'Edit Profile',
                icon: PhosphorIcons.pen_bold,
                onTap: () {
                  context.push(EditProfileView.routePath);
                },
              ),
              ItemProfile(
                title: 'Notification',
                icon: PhosphorIcons.bell_simple_bold,
                child: Switch(
                  value: _isSwitched,
                  onChanged: (value) {
                    setState(() {
                      _isSwitched = value;
                    });
                  },
                  activeColor: AppColors.kPrimaryColor,
                  activeTrackColor: AppColors.kPrimaryColor.withOpacity(0.5),
                  inactiveThumbColor: AppColors.kColorWhite,
                  inactiveTrackColor: AppColors.kColorGrey.withOpacity(0.5),
                ),
              ),
              ItemProfile(
                title: 'Change Language',
                icon: PhosphorIcons.globe_bold,
                onTap: () {
                  context.push(ChangeLanguageView.routePath);
                },
              ),
              ItemProfile(
                title: 'Change Password',
                icon: PhosphorIcons.lock_bold,
                onTap: () {
                  context.push(ChangePassword.routePath);
                },
              ),
              ItemProfile(
                title: 'Help & Support',
                icon: PhosphorIcons.headset_bold,
                onTap: () {
                  context.push(HelpAndSupportView.routePath);
                },
              ),
              const SizedBox(height: AppSpacing.xxxlg),
              ButtonAction(
                color: AppColors.kColorRed,
                height: 46,
                text: 'Log Out',
                onPressed: () {
                  ShowDialogWidget.showDialogLogOut(
                    context: context,
                    onPressed: () {
                      context.go(LoginView.routePath);
                    },
                  );
                },
              ),
              const SizedBox(height: AppSpacing.xlg),
            ],
          ),
        ),
      ),
    );
  }
}

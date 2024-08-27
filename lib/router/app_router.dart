import 'package:driver_flutter/features/authentication/login/view/login_view.dart';
import 'package:driver_flutter/features/authentication/status_view.dart';
import 'package:driver_flutter/features/history/views/history_detail_view.dart';
import 'package:driver_flutter/features/home/view/confirm_payment_view.dart';
import 'package:driver_flutter/features/home/view/drop_off_detail_view.dart';
import 'package:driver_flutter/features/home/view/drop_off_view.dart';
import 'package:driver_flutter/features/home/view/home_view.dart';
import 'package:driver_flutter/features/home/view/pick_up-view.dart';
import 'package:driver_flutter/features/main/view/main_view.dart';
import 'package:driver_flutter/features/maps/views/map_view.dart';
import 'package:driver_flutter/features/notifications/views/notification_view.dart';
import 'package:driver_flutter/features/profile/views/change_language.dart';
import 'package:driver_flutter/features/profile/views/change_password_view.dart';
import 'package:driver_flutter/features/profile/views/edit_profile_view.dart';
import 'package:driver_flutter/features/profile/views/help_and_support_view.dart';
import 'package:driver_flutter/features/profile/views/profile_view.dart';
import 'package:driver_flutter/features/profile/views/setting_view.dart';
import 'package:driver_flutter/features/splash/view/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final routerConfig = GoRouter(
    routes: [
      GoRoute(
        path: SplashView.routePath,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: HomeView.routePath,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: LoginView.routePath,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: MainView.routePath,
        builder: (context, state) => const MainView(),
      ),
      GoRoute(
        path: StatusView.routePath,
        builder: (context, state) => const StatusView(),
      ),
      GoRoute(
        path: PickupView.routePath,
        builder: (context, state) => const PickupView(),
      ),
      GoRoute(
        path: DropOffView.routePath,
        builder: (context, state) => const DropOffView(),
      ),
      GoRoute(
        path: HistoryDetailView.routePath,
        builder: (context, state) {
          final id = state.extra;
          return HistoryDetailView(status: id! as String);
        },
      ),
      GoRoute(
        path: DropOffDetailView.routePath,
        builder: (context, state) => const DropOffDetailView(),
      ),
      GoRoute(
        path: ConfirmPaymentView.routePath,
        builder: (context, state) => const ConfirmPaymentView(),
      ),
      GoRoute(
        path: ProfileView.routePath,
        builder: (context, state) {
          return const ProfileView();
        },
      ),
      GoRoute(
        path: EditProfileView.routePath,
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        path: ChangePassword.routePath,
        builder: (context, state) => const ChangePassword(),
      ),
      GoRoute(
        path: MapView.routePath,
        builder: (context, state) => const MapView(),
      ),
      GoRoute(
        path: NotificationView.routePath,
        builder: (context, state) => const NotificationView(),
      ),
      GoRoute(
        path: HelpAndSupportView.routePath,
        builder: (context, state) => const HelpAndSupportView(),
      ),
      GoRoute(
        path: SettingView.routePath,
        builder: (context, state) => const SettingView(),
      ),
      GoRoute(
        path: ChangeLanguageView.routePath,
        builder: (context, state) => const ChangeLanguageView(),
      ),
    ],
  );
}

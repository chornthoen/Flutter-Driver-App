import 'package:driver_flutter/features/authentication/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const routePath = '/s';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.go(LoginView.routePath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(
        child: Image(
          image: AssetImage('assets/logo/splash_screen.png'),
          height: 180,
          width: 180,
        ),
      ),
    );
  }
}

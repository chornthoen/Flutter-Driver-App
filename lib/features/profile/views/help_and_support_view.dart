import 'package:driver_flutter/shared/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';

class HelpAndSupportView extends StatefulWidget {
  const HelpAndSupportView({super.key});

  static const routePath = '/help-and-support';

  @override
  State<HelpAndSupportView> createState() => _HelpAndSupportViewState();
}

class _HelpAndSupportViewState extends State<HelpAndSupportView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(title: 'Help & Support'),
    );
  }
}

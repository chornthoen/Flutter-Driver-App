import 'package:flutter/material.dart';

import '../../../shared/widgets/app_bar_custom.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  static const routePath = '/setting';

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(title: 'Setting'),
    );
  }
}

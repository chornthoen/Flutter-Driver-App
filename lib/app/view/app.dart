import 'package:driver_flutter/counter/counter.dart';
import 'package:driver_flutter/l10n/l10n.dart';
import 'package:driver_flutter/router/app_router.dart';
import 'package:driver_flutter/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.routerConfig,
    );
  }
}

import 'package:danapp_doit/core/core.dart';
import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          onGenerateRoute: generateRoute,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            appBarTheme: const AppBarTheme(
              color: AppColors.white,
            ),
            primaryColor: AppColors.primaryColor,
            colorScheme: ColorScheme.fromSwatch(
              accentColor: AppColors.primaryColor,
            ),
            useMaterial3: true,
          ),
          initialRoute: RouteName.splash,
        );
      },
    );
  }
}

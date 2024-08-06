import 'package:danapp_doit/core/core.dart';
import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  // static const androidChannel = AndroidNotificationChannel(
  //   'high_importance_channel',
  //   'High Importance Notifications',
  //   importance: Importance.high,
  //   description: 'Default notification channel',
  //   enableLights: true,
  // );

  // static final flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    // initialize local push notifications
    // App.flutterLocalNotificationsPlugin.initialize(
    //   const InitializationSettings(
    //     iOS: DarwinInitializationSettings(),
    //     android: AndroidInitializationSettings('ic_launcher'),
    //   ),
    // );

    // Sets the presentation options for Apple notifications when received in the foreground.
    // FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    //   alert: true,
    //   badge: true,
    //   sound: true,
    // );

    // Sets push notifications background message handler.
    // FirebaseMessaging.onBackgroundMessage(_showNotification);

    // show notification when app is open and in use
    // FirebaseMessaging.onMessage.listen(_showNotification);

    // handle when push notification when app is closed
    /// App is in the background (Android) & app is in foreground / background (iOS)
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    //   if (message.data.isNotEmpty) {
    //     await _handlePushNotificationNavigation(
    //       context,
    //       message.data['category'] as String,
    //     );
    //   }
    // });

    // handle initial firebase push notification
    /// App is terminated
    // FirebaseMessaging.instance.getInitialMessage().then(
    //   (RemoteMessage? message) async {
    //     if (message != null && message.data.isNotEmpty) {
    //       await _handlePushNotificationNavigation(
    //         context,
    //         message.data['category'] as String,
    //       );
    //     }
    //   },
    // );
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

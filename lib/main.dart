import 'dart:async';

import 'package:danapp_doit/app/app.dart';
import 'package:danapp_doit/bootstrap.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  const environment = kReleaseMode ? '.env.production' : '.env.development';

  await Future.wait([
    dotenv.load(fileName: environment),
  ]);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    // void catchUnhandledExceptions(Object error, StackTrace? stack) {
    //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    //   debugPrintStack(stackTrace: stack, label: error.toString());
    // }

    Bloc.observer = MyBlocObserver();

    runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const App(),
      ),
    );
  });
}

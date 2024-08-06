import 'dart:async';

import 'package:danapp_doit/app/app.dart';
import 'package:danapp_doit/bootstrap.dart';
import 'package:danapp_doit/core/core.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
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

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    void catchUnhandledExceptions(Object error, StackTrace? stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      debugPrintStack(stackTrace: stack, label: error.toString());
    }

    Bloc.observer = MyBlocObserver();

    await runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();

        FlutterError.onError = (FlutterErrorDetails details) {
          catchUnhandledExceptions(details.exception, details.stack);
        };

        runApp(
          DevicePreview(
            enabled: !kReleaseMode,
            builder: (context) => const App(),
          ),
        );
      },
      catchUnhandledExceptions,
    );
  });
}

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'core/presenter/app_injection.dart';
import 'firebase_options.dart';

import 'core/presenter/pay_flow_app.dart';

void main() {
  AppInjection.setUp();

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

      runApp(const PayFlowApp());
    },
    ((exception, stack) {
      FirebaseCrashlytics.instance.recordError(exception, stack);
    }),
  );
}

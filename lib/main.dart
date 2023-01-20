import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow/firebase_options.dart';

import 'src/modules/core/infrastructure/service_locator/service_locator.dart';
import 'src/modules/core/presenter/pay_flow_app.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    setUpInjections();
    // await serviceLocator.get<FirebaseMessagingService>().initialize();

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    runApp(const PayFlowApp());
  }, (Object error, StackTrace stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
  });
}

import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'firebase_options.dart';
import 'pay_flow_app.dart';
import 'src/core/infrastructure/service_locator/service_locator.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    configureDependencies();
    await Future.wait([
      MobileAds.instance.initialize(),
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
      FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true),
    ]);

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const PayFlowApp(),
      ),
    );
  }, (Object error, StackTrace stack) {
    if (kReleaseMode) {
      FirebaseCrashlytics.instance.recordError(error, stack);
    }
  });
}

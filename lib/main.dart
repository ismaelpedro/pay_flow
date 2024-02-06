import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:injectable/injectable.dart';

// import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'firebase_options.dart';
import 'pay_flow_app.dart';
import 'src/core/infrastructure/service_locator/service_locator.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await MobileAds.instance.initialize();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    configureDependencies(Environment.prod);
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp(
      kDebugMode
          ? DevicePreview(
              builder: (context) => const PayFlowApp(),
            )
          : const PayFlowApp(),
    );
  }, (Object error, StackTrace stack) {
    if (kReleaseMode) {
      FirebaseCrashlytics.instance.recordError(error, stack);
    }
  });
}

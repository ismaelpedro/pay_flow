import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pay_flow/firebase_options.dart';

import 'src/modules/core/infrastructure/service_locator/service_locator.dart';
import 'src/modules/core/presenter/pay_flow_app.dart';
import 'src/modules/core/services/firebase_messaging_service.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await MobileAds.instance.initialize();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    setUpInjections();
    await serviceLocator.get<FirebaseMessagingService>().initialize();
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    runApp(const PayFlowApp());
  }, (Object error, StackTrace stack) {
    if (kReleaseMode) {
      FirebaseCrashlytics.instance.recordError(error, stack);
    }
  });
}

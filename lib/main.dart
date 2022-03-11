import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/presenter/app_widget.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await dotenv.load(fileName: 'assets/hasura_settings.env');
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    runApp(const AppWidget());
  }, ((exception, stack) {
    FirebaseCrashlytics.instance.recordError(exception, stack);
  }));
}

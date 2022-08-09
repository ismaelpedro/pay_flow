import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'src/modules/core/presenter/app_injection.dart';
import 'src/modules/core/presenter/pay_flow_app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AppInjection.setUp();
  runApp(const PayFlowApp());
}

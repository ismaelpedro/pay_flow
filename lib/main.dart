import 'package:flutter/material.dart';

import 'core/presenter/app_injection.dart';
import 'core/presenter/pay_flow_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  AppInjection.setUp();
  runApp(const PayFlowApp());
}

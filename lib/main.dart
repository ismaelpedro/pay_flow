import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'firebase_options.dart';
import 'src/modules/core/presenter/pay_flow_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait(<Future<Object?>>[
    MobileAds.instance.initialize(),
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
  ]);

  runApp(const PayFlowApp());
}

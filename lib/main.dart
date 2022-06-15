import 'package:flutter/material.dart';
import 'core/presenter/app_injection.dart';
import 'core/presenter/pay_flow_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppInjection.setUp();
  runApp(const PayFlowApp());
}

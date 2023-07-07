import 'package:flutter/material.dart';
import 'package:pay_flow/i18n/strings.g.dart';

extension BuildContextExtensions on BuildContext {
  Size get mediaQuery => MediaQuery.of(this).size;
  dynamic get i18n => AppLocale.en.build();
}

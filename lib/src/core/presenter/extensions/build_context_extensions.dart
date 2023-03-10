// ignore_for_file: always_declare_return_types

import 'package:flutter/material.dart';
import 'package:pay_flow/i18n/strings.g.dart';

extension BuildContextExtensions on BuildContext {
  Size get mediaQuery => MediaQuery.of(this).size;
  get i18n => AppLocale.en.build();
}

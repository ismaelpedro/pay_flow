import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextExtensions on BuildContext {
  Size get mediaQuery => MediaQuery.of(this).size;
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}

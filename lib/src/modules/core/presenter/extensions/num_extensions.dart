import 'package:intl/intl.dart';

extension NumExtensions on num {
  String toCurrencyBRL() {
    return NumberFormat.simpleCurrency(
      locale: 'pt_BR',
      decimalDigits: 2,
    ).format(this);
  }
}

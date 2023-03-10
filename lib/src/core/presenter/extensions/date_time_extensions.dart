import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String formatDateDDMMYYYY() => DateFormat('dd/MM/yyyy').format(this);
}

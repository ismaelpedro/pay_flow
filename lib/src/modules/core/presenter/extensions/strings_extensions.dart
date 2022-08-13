import 'package:intl/intl.dart';

extension StringsExtensions on String {
  String toDateTime() {
    DateTime date = DateFormat('dd/MM/yyyy').parse(this);
    return DateFormat('yyyy-MM-dd').format(date);
  }
}

import 'dart:async';

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {

}
String getDateFormat() {
  initializeDateFormatting('ja');
  return DateFormat.yMMMd('ja').format(DateTime.now()).toString();
}
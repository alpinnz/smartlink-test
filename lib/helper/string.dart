import 'package:intl/intl.dart';

class StringHelper {
  static dateAdd(milliseconds) {
    DateTime now = DateTime.now();
    DateTime currentTime = now.add(Duration(milliseconds: milliseconds));
    return DateFormat('yyyy-MM-dd H:m').format(currentTime).toString();
  }

  static price(value) {
    final formatCurrency = new NumberFormat.simpleCurrency(locale: 'id_ID');
    return '${formatCurrency.format(value)},-';
  }
}

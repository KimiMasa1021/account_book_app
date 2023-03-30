import 'package:intl/intl.dart';

class FormatText {
  static String formatYen(int targetPrice) {
    final numberFormat = NumberFormat(',###');
    return numberFormat.format(targetPrice);
  }
}

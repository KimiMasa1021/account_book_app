import 'package:intl/intl.dart';

class FormatText {
  static String formatYen(int targetPrice) {
    final numberFormat = NumberFormat(',###');
    return numberFormat.format(targetPrice);
  }

  static String formatWeek(int index) {
    switch (index) {
      case 1:
        return "月";
      case 2:
        return "火";
      case 3:
        return "水";
      case 4:
        return "木";
      case 5:
        return "金";
      case 6:
        return "土";
      case 7:
        return "日";
      default:
        return "";
    }
  }
}

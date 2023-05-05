import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 20) {
      return oldValue;
    }
    if (newValue.text.isEmpty) {
      return newValue;
    }
    if (newValue.text.substring(0) == "0") {
      return oldValue;
    }
    if (newValue.text.contains(RegExp(r'[a-zA-Z-._ ]'))) {
      return oldValue;
    }
    if (newValue.text.length >= 4) {
      int culcInt = int.parse(newValue.text.replaceAll(",", ""));
      var result = NumberFormat("#,###").format(culcInt);
      return newValue.copyWith(
        text: result,
        selection: TextSelection.collapsed(offset: result.length),
      );
    }

    return newValue;
  }
}

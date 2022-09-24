import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.contains('-') ||
        newValue.text.contains('.') ||
        newValue.text.contains(' ')) {
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
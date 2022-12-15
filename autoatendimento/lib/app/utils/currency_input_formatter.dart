import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  final bool percentual;

  CurrencyInputFormatter({this.percentual = false});

  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);

    var formatter;
    if (percentual) {
      formatter = new NumberFormat("##0.00");
    } else {
      formatter = new NumberFormat("#,##0.00");
    }

    String newText = formatter.format(value / 100);

    return newValue.copyWith(
        text: newText,
        selection: new TextSelection.collapsed(offset: newText.length));
  }
}

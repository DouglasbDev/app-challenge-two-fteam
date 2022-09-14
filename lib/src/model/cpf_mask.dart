import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CpfMask extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 14 ||
        !RegExp(r'^([\d-.]+)?$').hasMatch(newValue.text)) {
      return oldValue;
    }

    var cpf = newValue.text.replaceAll(RegExp(r'\D'), '');
    final characters = cpf.characters.toList();
    var formatted = '';

    for (var i = 0; i < characters.length; i++) {
      if (i == 3) {
        formatted += '.';
        formatted += characters[i];
      } else if (i == 6) {
        formatted += '.';
        formatted += characters[i];
      } else if (i == 9) {
        formatted += '-';
        formatted += characters[i];
      } else {
        formatted += characters[i];
      }
    }

    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.fromPosition(
        TextPosition(offset: formatted.length),
      ),
    );
  }
}

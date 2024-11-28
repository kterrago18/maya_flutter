import 'package:flutter/services.dart';

class TextInputFilter {
  TextInputFilter._();

  static final Pattern _patternAmount = RegExp(r'^(?!0\d)\d+\.?\d{0,2}');

  static FilteringTextInputFormatter limitToAmountOnly() {
    return FilteringTextInputFormatter.allow(_patternAmount);
  }
}

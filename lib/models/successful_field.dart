import 'package:flutter/material.dart';

class SuccessfulField {
  static const noAuthorText = '---';
  final String fieldName;
  final bool success;

  Color get color {
    if (!success)
      return Colors.red;
    else if (fieldName == noAuthorText)
      return Colors.yellow;
    else
      return Colors.green;
  }

  SuccessfulField({required this.fieldName, required this.success});

  factory SuccessfulField.initial() {
    return SuccessfulField(fieldName: noAuthorText, success: true);
  }
}

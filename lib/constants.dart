import 'package:flutter/material.dart';

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
    borderSide: BorderSide.none,
  ),
  hintText: 'Введите номер заказа',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
);

final kAddButtonStyle = ElevatedButton.styleFrom(
  textStyle: TextStyle(fontSize: 12.0), /*fixedSize: Size()*/
);

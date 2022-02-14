import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  const Field({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.prefixIcon,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final Icon? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        disabledBorder: InputBorder.none,
        hintText: hintText,
      ),
    );
  }
}

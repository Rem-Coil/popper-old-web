import 'package:flutter/material.dart';
import 'package:popper/models/successful_field.dart';

class AuthorBox extends StatelessWidget {
  final SuccessfulField boxData;

  const AuthorBox({required this.boxData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: boxData.color),
      child: Text(boxData.fieldName, textAlign: TextAlign.center),
    );
  }
}

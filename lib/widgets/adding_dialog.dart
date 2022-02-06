import 'package:flutter/material.dart';

class AddingDialog extends StatelessWidget {
  final Widget child;

  const AddingDialog({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.only(
          top: 20.0,
          left: 10.0,
          right: 10.0,
          bottom: 10.0,
        ),
        child: child,
      ),
    );
  }
}

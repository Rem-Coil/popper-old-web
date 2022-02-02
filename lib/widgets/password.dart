import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  final String password;

  const Password({Key? key, required this.password}) : super(key: key);

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool _visibility = false;
  @override
  Widget build(BuildContext context) {
    Widget text;
    IconData icon;
    String passInvisible = widget.password.replaceAll(RegExp(r"[^\s]"), '•');
    if (!_visibility) {
      text = Text(passInvisible);
      icon = Icons.visibility;
    } else {
      text = Text(widget.password);
      icon = Icons.visibility_off;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        text,
        IconButton(
          onPressed: () {
            setState(() {
              _visibility = !_visibility;
            });
          },
          icon: Icon(icon),
          splashRadius: 15.0,
        )
      ],
    );
  }
}

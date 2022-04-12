import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final Widget headerWidget;

  const Header({
    Key? key,
    required this.title,
    required this.headerWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20),
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(width: 50),
        Spacer(),
        headerWidget,
      ],
    );
  }
}

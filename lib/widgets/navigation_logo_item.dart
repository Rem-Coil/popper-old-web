import 'package:flutter/material.dart';

class NavigationLogoItem extends StatelessWidget {
  const NavigationLogoItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Image.asset('images/logo.png'),
    );
  }
}

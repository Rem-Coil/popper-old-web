import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NavigationLogoItem extends StatelessWidget {
  const NavigationLogoItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Image.asset(
          "${(kDebugMode && kIsWeb) ? "" : "assets/"}images/logo.png"),
    );
  }
}

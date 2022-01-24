import 'package:flutter/material.dart';
import 'package:popper/constants.dart';
import 'package:popper/models/route.dart';
import 'package:popper/screen/base_header.dart';
import 'package:popper/widgets/navigation_controller.dart';
import 'package:provider/provider.dart';

// import 'package:slot_service_app/ui/view_models/route.dart';

class MainScreen extends StatelessWidget {
  final int screenIndex;
  final String title;
  final String currentRoute;
  final Widget child;

  const MainScreen(
      {Key? key,
      required this.screenIndex,
      required this.title,
      required this.currentRoute,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) => RouteHolder(currentRoute),
      child: Scaffold(
        drawer: NavigationController(currentScreen: screenIndex),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: NavigationController(currentScreen: screenIndex)),
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    _getHeader(),
                    _getMainWidgetDecoration(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getHeader() => Expanded(child: Header(title: title));

  Widget _getMainWidgetDecoration(BuildContext context) => Expanded(
        flex: 19,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(color: Colors.white10),
          ),
          margin: EdgeInsets.only(left: defaultPadding, top: 30),
          padding: EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: defaultPadding,
          ),
          child: child,
        ),
      );
}

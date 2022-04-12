import 'package:flutter/material.dart';
import 'package:popper/screen/base/ui/base_main_screen.dart';
import 'package:popper/screen/settings/ui/widgets/network_settings.dart';

class SettingsScreen extends StatefulWidget {
  static const route = '/settings';
  static const screenNumber = 3;

  SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return MainScreen(
      screenIndex: SettingsScreen.screenNumber,
      title: 'Настройки',
      currentRoute: SettingsScreen.route,
      headerWidget: SizedBox.shrink(),
      child: NetworkSettings(
        title: 'Host:',
      ),
    );
  }
}

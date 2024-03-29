import 'package:flutter/material.dart';
import 'package:popper/widgets/navigation/navigation_model.dart';
import 'package:popper/screen/operators/ui/operators_screen.dart';
import 'package:popper/screen/settings/ui/settings_screen.dart';
import 'package:popper/screen/tasks/ui/tasks_screen.dart';
import 'package:popper/widgets/navigation/navigation_list.dart';

class NavigationController extends StatelessWidget {
  static final screenList = [
    NavigationItemInfo(
      icon: Icons.article_outlined,
      title: 'Список заданий',
      route: TasksPage.route,
      index: TasksPage.screenNumber,
    ),
    NavigationItemInfo(
      icon: Icons.person,
      title: 'Сотрудники',
      route: OperatorsScreen.route,
      index: OperatorsScreen.screenNumber,
    ),
    NavigationItemInfo(
      icon: Icons.settings,
      title: 'Настройки',
      route: SettingsScreen.route,
      index: SettingsScreen.screenNumber,
    ),
  ];

  final int currentScreen;

  const NavigationController({Key? key, required this.currentScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenList..sort((a, b) => a.index.compareTo(b.index));
    return NavigationList(
        navigationItems: screenList, selectedItem: currentScreen);
  }
}

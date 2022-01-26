import 'package:flutter/material.dart';
import 'package:popper/models/navigation_model.dart';
import 'package:popper/screen/tasks/ui/task_information_screen.dart';
import 'package:popper/screen/tasks/ui/tasks_screen.dart';
import 'package:popper/widgets/navigation_list.dart';

class NavigationController extends StatelessWidget {
  static final screenList = [
    NavigationItemInfo(
      icon: Icons.article_outlined,
      title: 'Список заданий',
      route: TasksPage.route,
      index: TasksPage.screenNumber,
    ),
    NavigationItemInfo(
      icon: Icons.task_rounded,
      title: 'Задачи',
      route: InformationPage.route,
      index: InformationPage.screenNumber,
    ),
    // NavigationItemInfo(                  // На будущий экран
    //   icon: Icons.account_box_rounded,
    //   title: 'Сотрудники',
    //   route: EmployeesScreen.route,
    //   index: EmployeesScreen.screenNumber,
    // ),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popper/constants.dart';
import 'package:popper/screen/tasks/bloc/tasks_bloc.dart';
import 'package:popper/screen/operators/bloc/operators_bloc.dart';
import 'package:popper/screen/operators/ui/operators_screen.dart';
import 'package:popper/screen/settings/ui/settings_screen.dart';
import 'package:popper/screen/tasks/ui/tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TasksBloc()),
      ],
      child: MaterialApp(
        title: 'Popper',
        theme: ThemeData(
          canvasColor: bgColor,
          scaffoldBackgroundColor: bgColor,
          primaryColor: primaryColor,
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case TasksPage.route:
              return PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => TasksPage(),
                transitionDuration: Duration(seconds: 0),
              );
            case OperatorsScreen.route:
              return PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => BlocProvider(
                    child: OperatorsScreen(),
                    create: (context) {
                      return OperatorsBloc();
                    }),
                transitionDuration: Duration(seconds: 0),
              );
            case SettingsScreen.route:
              return PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    SettingsScreen(),
                transitionDuration: Duration(seconds: 0),
              );
          }
        },
        initialRoute: TasksPage.route,
      ),
    );
  }
}

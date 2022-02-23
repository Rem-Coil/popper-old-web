import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popper/constants.dart';
import 'package:popper/screen/tasks/bloc/datatable_bloc.dart';
import 'package:popper/screen/tasks/bloc/operators_bloc.dart';
import 'package:popper/screen/tasks/ui/operators_screen.dart';
import 'package:popper/screen/tasks/ui/settings_screen.dart';
import 'package:popper/screen/tasks/ui/tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DataTableBloc()),
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

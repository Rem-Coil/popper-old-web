import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popper/constants.dart';
import 'package:popper/screen/tasks/bloc/datatable_bloc.dart';
import 'package:popper/screen/tasks/bloc/operators_bloc.dart';
import 'package:popper/screen/tasks/ui/operators_screen.dart';
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
              return MaterialPageRoute(builder: (context) => TasksPage());
            case OperatorsScreen.route:
              return MaterialPageRoute(
                  builder: (context) => BlocProvider(
                      child: OperatorsScreen(),
                      create: (context) {
                        return OperatorsBloc();
                      }));
          }
        },
        initialRoute: TasksPage.route,
      ),
    );
  }
}

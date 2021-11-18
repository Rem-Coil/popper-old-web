import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popper/screen/tasks/bloc/datatable_bloc.dart';
import 'package:popper/screen/tasks/bloc/task_information_bloc.dart';
import 'package:popper/screen/tasks/ui/task_information_screen.dart';
import 'package:popper/screen/tasks/ui/tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TaskInformationBloc()),
        BlocProvider(create: (_) => DataTableBloc()),
      ],
      child: MaterialApp(
        title: 'Popper',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          TasksPage.route: (_) => TasksPage(),
          InformationPage.route: (_) => InformationPage(),
        },
        initialRoute: TasksPage.route,
      ),
    );
  }
}

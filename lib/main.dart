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
    return MaterialApp(
      title: 'Popper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<TaskInformationBloc>(
        create: (_) => TaskInformationBloc(),
        child: InformationPage(title: 'Popper demo page'),
      ),
    );
  }
}

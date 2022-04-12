import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popper/core/network/server_settings.dart';
import 'package:popper/screen/base/ui/base_main_screen.dart';
import 'package:popper/screen/tasks/bloc/tasks_event.dart';
import 'package:popper/screen/tasks/bloc/tasks_state.dart';
import 'package:popper/screen/tasks/bloc/tasks_bloc.dart';
import 'package:popper/screen/task_information/ui/tasks_dialog.dart';
import 'package:popper/screen/task_information/ui/widgets/new_task_form.dart';
import 'package:popper/screen/task_information/bloc/task_information_bloc.dart';
import 'package:popper/widgets/adding_dialog.dart';
import 'package:popper/screen/task_information/ui/widgets/search_form.dart';
import 'package:popper/widgets/status_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class TasksPage extends StatefulWidget {
  static const route = '/task_information';
  static const screenNumber = 1;

  TasksPage({Key? key}) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  void initState() {
    context.read<TasksBloc>().add(GetTasks());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      screenIndex: TasksPage.screenNumber,
      title: 'Список заданий',
      currentRoute: TasksPage.route,
      headerWidget: IconButton(
        icon: Icon(Icons.replay),
        onPressed: () {
          BlocProvider.of<TasksBloc>(context).add(GetTasks());
        },
      ),
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SearchForm(),
                  flex: 9,
                ),
                Expanded(
                  child: FloatingActionButton(
                    mini: true,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AddingDialog(
                          child: NewTaskForm(),
                        ),
                      );
                    },
                    child: Icon(Icons.add),
                  ),
                  flex: 1,
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                primary: false,
                scrollDirection: Axis.vertical,
                child: Container(
                  child: BlocBuilder<TasksBloc, TasksState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StatusBar(
                            error: state.errorMessage,
                            hasElements: state.listBobinas.isNotEmpty,
                            hasError: state.hasError,
                            isLoad: state.isLoad,
                          ),
                          DataTable(
                            showCheckboxColumn: false,
                            columnSpacing: 15.0,
                            columns: [
                              DataColumn(
                                  label: Container(
                                      child: Text('Имя'), width: 100.0)),
                              DataColumn(
                                  label: Container(
                                      child: Text('Номер'), width: 80.0)),
                              DataColumn(
                                  label: Container(
                                      child: Center(child: Text('Кол-во')),
                                      width: 60.0)),
                              DataColumn(label: Text('Намотка')),
                              DataColumn(label: Text('Вывод')),
                              DataColumn(label: Text('Изолировка')),
                              DataColumn(label: Text('Формовка')),
                              DataColumn(label: Text('Опрессовка')),
                              DataColumn(label: Text('ОТК')),
                              DataColumn(label: Text('Испытания')),
                              DataColumn(label: Text('')),
                              DataColumn(label: Text('')),
                            ],
                            rows: state.listBobinas.map((bobina) {
                              return DataRow(
                                onSelectChanged: (_) {
                                  showDialog(
                                      context: context,
                                      builder: (context) => BlocProvider(
                                          child: TasksDialog(id: bobina.id),
                                          create: (context) =>
                                              TaskInformationBloc()));
                                },
                                cells: <DataCell>[
                                  DataCell(Text(bobina.taskName)),
                                  DataCell(Text(bobina.taskNumber)),
                                  DataCell(Center(
                                      child: Text(bobina.quantity.toString()))),
                                  DataCell(Center(
                                      child: Text(bobina.winding.toString()))),
                                  DataCell(Center(
                                      child: Text(bobina.output.toString()))),
                                  DataCell(Center(
                                      child:
                                          Text(bobina.isolation.toString()))),
                                  DataCell(Center(
                                      child: Text(bobina.molding.toString()))),
                                  DataCell(Center(
                                      child: Text(bobina.crimping.toString()))),
                                  DataCell(Center(
                                      child: Text(bobina.quality.toString()))),
                                  DataCell(Center(
                                      child: Text(bobina.testing.toString()))),
                                  DataCell(IconButton(
                                    icon: Icon(Icons.qr_code),
                                    color: Colors.black38,
                                    splashRadius: 15.0,
                                    onPressed: () async {
                                      final currentServerType =
                                          await ServerSettings.getServerType();
                                      String url = currentServerType.url +
                                          '/bobbin/codes/${bobina.id}';
                                      if (!await launch(url)) {
                                        // TODO Обработка ошибки красиво
                                        // throw 'Could not launch $url';
                                      }
                                    },
                                  )),
                                  DataCell(IconButton(
                                    icon: Icon(Icons.delete),
                                    iconSize: 20.0,
                                    color: Colors.black38,
                                    splashRadius: 15.0,
                                    onPressed: () {
                                      setState(() {
                                        BlocProvider.of<TasksBloc>(context)
                                            .add(DeleteTask(id: bobina.id));
                                      });
                                    },
                                  ))
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popper/screen/tasks/bloc/task_information_bloc.dart';
import 'package:popper/screen/tasks/bloc/task_information_event.dart';
import 'package:popper/screen/tasks/bloc/task_information_state.dart';
import 'package:popper/widgets/fullscreen_dialog.dart';
import 'package:popper/widgets/status_bar.dart';

class TasksDialog extends StatefulWidget {
  final int id;

  const TasksDialog({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _TasksDialogState createState() => _TasksDialogState();
}

class _TasksDialogState extends State<TasksDialog> {
  final TaskInformationBloc blo = TaskInformationBloc();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TaskInformationBloc>(context)
        .add(ShowTaskInformation(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return FullScreenDialog(
      title: 'Данные по выбранному заказу',
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Закрыть'),
        )
      ],
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: BlocBuilder<TaskInformationBloc, TaskInformationState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  StatusBar(
                    error: state.errorMessage,
                    hasElements: state.infoList.isNotEmpty,
                    hasError: state.hasError,
                    isLoad: state.isLoad,
                  ),
                  DataTable(
                    columns: [
                      DataColumn(label: Text('Номер')),
                      DataColumn(label: Text('Намотка')),
                      DataColumn(label: Text('Вывод')),
                      DataColumn(label: Text('Изолировка')),
                      DataColumn(label: Text('Формовка')),
                      DataColumn(label: Text('Опрессовка')),
                      DataColumn(label: Text('ОТК')),
                      DataColumn(label: Text('Испытания')),
                    ],
                    rows: state.infoList
                        .map(
                          (information) => DataRow(
                            cells: <DataCell>[
                              DataCell(Text(information.taskName)),
                              DataCell(Text(
                                information.winding.fieldName,
                                style: TextStyle(
                                    backgroundColor: information.winding.success
                                        ? Colors.white
                                        : Colors.redAccent),
                              )),
                              DataCell(Text(
                                information.output.fieldName,
                                style: TextStyle(
                                    backgroundColor: information.output.success
                                        ? Colors.white
                                        : Colors.redAccent),
                              )),
                              DataCell(Text(
                                information.isolation.fieldName,
                                style: TextStyle(
                                    backgroundColor:
                                        information.isolation.success
                                            ? Colors.white
                                            : Colors.redAccent),
                              )),
                              DataCell(Text(
                                information.molding.fieldName,
                                style: TextStyle(
                                    backgroundColor: information.molding.success
                                        ? Colors.white
                                        : Colors.redAccent),
                              )),
                              DataCell(Text(
                                information.crimping.fieldName,
                                style: TextStyle(
                                    backgroundColor:
                                        information.crimping.success
                                            ? Colors.white
                                            : Colors.redAccent),
                              )),
                              DataCell(Text(
                                information.quality.fieldName,
                                style: TextStyle(
                                    backgroundColor: information.quality.success
                                        ? Colors.white
                                        : Colors.redAccent),
                              )),
                              DataCell(Text(
                                information.testing.fieldName,
                                style: TextStyle(
                                    backgroundColor: information.testing.success
                                        ? Colors.white
                                        : Colors.redAccent),
                              )),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

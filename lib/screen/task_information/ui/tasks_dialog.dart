import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popper/screen/task_information/bloc/task_information_bloc.dart';
import 'package:popper/screen/task_information/bloc/task_information_event.dart';
import 'package:popper/screen/task_information/bloc/task_information_state.dart';
import 'package:popper/widgets/autor_box.dart';
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
                    columnSpacing: 15.0,
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
                              DataCell(AuthorBox(boxData: information.winding)),
                              DataCell(AuthorBox(boxData: information.output)),
                              DataCell(
                                  AuthorBox(boxData: information.isolation)),
                              DataCell(AuthorBox(boxData: information.molding)),
                              DataCell(
                                  AuthorBox(boxData: information.crimping)),
                              DataCell(AuthorBox(boxData: information.quality)),
                              DataCell(AuthorBox(boxData: information.testing)),
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

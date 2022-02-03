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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StatusBar(
                    error: state.errorMessage,
                    hasElements: state.infoList.isNotEmpty,
                    hasError: state.hasError,
                    isLoad: state.isLoad,
                  ),
                  DataTable(
                    columns: [
                      DataColumn(
                        label: Text('Name'),
                      ),
                      DataColumn(
                        label: Text('Winding'),
                      ),
                      DataColumn(
                        label: Text('Output'),
                      ),
                      DataColumn(
                        label: Text('Isolation'),
                      ),
                      DataColumn(
                        label: Text('Molding'),
                      ),
                      DataColumn(
                        label: Text('Crimping'),
                      ),
                      DataColumn(
                        label: Text('Quality'),
                      ),
                      DataColumn(
                        label: Text('Testing'),
                      ),
                    ],
                    rows: state.infoList
                        .map(
                          (information) => DataRow(
                            cells: <DataCell>[
                              DataCell(Text(information.taskName)),
                              DataCell(Text(information.winding)),
                              DataCell(Text(information.output)),
                              DataCell(Text(information.isolation)),
                              DataCell(Text(information.molding)),
                              DataCell(Text(information.crimping)),
                              DataCell(Text(information.quality)),
                              DataCell(Text(information.testing)),
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

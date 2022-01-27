import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popper/screen/base_mian%20screen.dart';
import 'package:popper/screen/tasks/bloc/dataTable_event.dart';
import 'package:popper/screen/tasks/bloc/dataTable_state.dart';
import 'package:popper/screen/tasks/bloc/datatable_bloc.dart';
import 'package:popper/screen/tasks/bloc/task_information_bloc.dart';
import 'package:popper/screen/tasks/ui/tasks_dialog.dart';
import 'package:popper/widgets/new_task_form.dart';
import 'package:popper/widgets/search_form.dart';
import 'package:popper/widgets/status_bar.dart';

class TasksPage extends StatefulWidget {
  static const route = '/tasks';
  static const screenNumber = 1;

  TasksPage({Key? key}) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  void initState() {
    context.read<DataTableBloc>().add(ShowDataTable());

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
          BlocProvider.of<DataTableBloc>(context).add(ShowDataTable());
        },
      ),
      child: Center(
        child: Column(
          children: [
            NewTaskForm(),
            SearchForm(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: BlocBuilder<DataTableBloc, DataTableState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          StatusBar(
                            error: state.errorMessage,
                            hasElements: state.listBobinas.isNotEmpty,
                            hasError: state.hasError,
                            isLoad: state.isLoad,
                          ),
                          DataTable(
                            showCheckboxColumn: false,
                            columns: [
                              DataColumn(
                                label: Text('Name'),
                              ),
                              DataColumn(
                                label: Text('Number'),
                              ),
                              DataColumn(
                                label: Text('Count'),
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
                                  DataCell(Text(bobina.quantity.toString())),
                                  DataCell(Text(bobina.winding.toString())),
                                  DataCell(Text(bobina.output.toString())),
                                  DataCell(Text(bobina.isolation.toString())),
                                  DataCell(Text(bobina.molding.toString())),
                                  DataCell(Text(bobina.crimping.toString())),
                                  DataCell(Text(bobina.quality.toString())),
                                  DataCell(Text(bobina.testing.toString())),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popper/screen/tasks/bloc/dataTable_event.dart';
import 'package:popper/screen/tasks/bloc/dataTable_state.dart';
import 'package:popper/screen/tasks/bloc/datatable_bloc.dart';
import 'package:popper/screen/tasks/ui/task_information_screen.dart';
import 'package:popper/widgets/new_task_form.dart';

class TasksPage extends StatefulWidget {
  static const route = '/tasks';

  TasksPage({Key? key}) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DataTableBloc>(context).add(ShowDataTable());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(Icons.replay),
              onPressed: () {
                BlocProvider.of<DataTableBloc>(context).add(ShowDataTable());
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              NewTaskForm(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    child: BlocBuilder<DataTableBloc, DataTableState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 16,
                              child: _StatusText(
                                hasError:
                                    state.listBobinas.isEmpty && state.hasError,
                                hasBobbins: state.listBobinas.isEmpty,
                                error: state.err,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                              child: state.listBobinas.isEmpty || state.isLoad
                                  ? LinearProgressIndicator(
                                      backgroundColor: Colors.white)
                                  : null,
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
                                    Navigator.of(context).pushNamed(
                                      InformationPage.route,
                                      arguments: bobina.id,
                                    );
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
      ),
    );
  }
}

class _StatusText extends StatelessWidget {
  final onEmptyBobbinsText =
      'Список катушек пуст или произошла ошибка загрузки данных, попробуйте позже';
  final bool hasError;
  final String? error;
  final bool hasBobbins;

  const _StatusText({
    Key? key,
    required this.error,
    required this.hasBobbins,
    required this.hasError,
  })  : assert(!hasError || error != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (hasError) return Text(error!);
    if (hasBobbins) return Text(onEmptyBobbinsText);
    return Container();
  }
}

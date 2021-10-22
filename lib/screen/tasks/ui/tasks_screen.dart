import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popper/screen/tasks/bloc/dataTable_event.dart';
import 'package:popper/screen/tasks/bloc/dataTable_state.dart';
import 'package:popper/screen/tasks/bloc/datatable_bloc.dart';
import 'package:popper/widgets/new_task_form.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DataTableBloc>(context).add(ShowDataTable());
  }

  @override
  Widget build(BuildContext context) {
    // test
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                        return DataTable(
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
                            DataColumn(label: Text('')),
                          ],
                          rows: state.listBobinas
                              .map(
                                (bobina) => DataRow(
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
                                    DataCell(ElevatedButton(
                                      child: Text('More information'),
                                      onPressed: () {
                                        print('button ${bobina.taskName}');
                                      },
                                    ))
                                  ],
                                ),
                              )
                              .toList(),
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

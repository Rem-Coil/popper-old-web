import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popper/screen/tasks/bloc/dataTable_event.dart';
import 'package:popper/screen/tasks/bloc/dataTable_state.dart';
import 'package:popper/screen/tasks/bloc/datatable_bloc.dart';
import 'package:popper/screen/tasks/bloc/task_information_bloc.dart';
import 'package:popper/screen/tasks/bloc/task_information_event.dart';
import 'package:popper/screen/tasks/bloc/task_information_state.dart';
import 'package:popper/widgets/new_task_form.dart';

class InformationPage extends StatefulWidget {
  InformationPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TaskInformationBloc>(context).add(ShowTaskInformation('7'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(Icons.replay),
              onPressed: () {
                BlocProvider.of<TaskInformationBloc>(context)
                    .add(ShowTaskInformation('7'));
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    child:
                        BlocBuilder<TaskInformationBloc, TaskInformationState>(
                      builder: (context, state) {
                        return DataTable(
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

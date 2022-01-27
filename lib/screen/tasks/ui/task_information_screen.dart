import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popper/screen/base_mian%20screen.dart';
import 'package:popper/screen/tasks/bloc/task_information_bloc.dart';
import 'package:popper/screen/tasks/bloc/task_information_event.dart';
import 'package:popper/screen/tasks/bloc/task_information_state.dart';
import 'package:popper/widgets/status_bar.dart';

class InformationPage extends StatefulWidget {
  static const route = '/taskInfo';
  static const screenNumber = 2;
  final int id;

  InformationPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TaskInformationBloc>(context)
        .add(ShowTaskInformation(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      screenIndex: InformationPage.screenNumber,
      title: 'Катушки',
      currentRoute: InformationPage.route,
      headerWidget: SizedBox.shrink(),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
          ),
        ],
      ),
    );
  }
}

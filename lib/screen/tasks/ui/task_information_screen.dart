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
  static const route = '/taskInfo';
  InformationPage({Key? key}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  late int id;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      id = ModalRoute.of(context)!.settings.arguments as int;
      BlocProvider.of<TaskInformationBloc>(context)
          .add(ShowTaskInformation(id));
    });
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
                BlocProvider.of<TaskInformationBloc>(context)
                    .add(ShowTaskInformation(id));
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
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16,
                              child: _StatusText(
                                hasError:
                                    state.infoList.isEmpty && state.hasError,
                                hasBobbins: state.infoList.isEmpty,
                                error: state.err,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                              child: state.infoList.isEmpty || state.isLoad
                                  ? LinearProgressIndicator(
                                      backgroundColor: Colors.white)
                                  : null,
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

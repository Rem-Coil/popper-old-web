import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popper/screen/base_mian%20screen.dart';
import 'package:popper/screen/tasks/bloc/operators_bloc.dart';
import 'package:popper/screen/tasks/bloc/operators_event.dart';
import 'package:popper/screen/tasks/bloc/operators_state.dart';
import 'package:popper/widgets/password.dart';
import 'package:popper/widgets/status_bar.dart';

class OperatorsScreen extends StatefulWidget {
  static const route = '/operators';
  static const screenNumber = 2;

  OperatorsScreen({Key? key}) : super(key: key);

  @override
  _OperatorsScreenState createState() => _OperatorsScreenState();
}

class _OperatorsScreenState extends State<OperatorsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<OperatorsBloc>(context).add(ShowOperators());
  }

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      screenIndex: OperatorsScreen.screenNumber,
      title: 'Сотрудники',
      currentRoute: OperatorsScreen.route,
      headerWidget: IconButton(
        icon: Icon(Icons.replay),
        onPressed: () {
          BlocProvider.of<OperatorsBloc>(context).add(ShowOperators());
        },
      ),
      child: Expanded(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: BlocBuilder<OperatorsBloc, OperatorsState>(
              builder: (context, state) {
                return Column(
                  children: [
                    StatusBar(
                      error: state.errorMessage,
                      hasElements: state.listOperators.isNotEmpty,
                      hasError: state.hasError,
                      isLoad: state.isLoad,
                    ),
                    DataTable(
                      showCheckboxColumn: false,
                      columns: [
                        DataColumn(
                          label: Text('Имя'),
                        ),
                        DataColumn(
                          label: Text('Фамилия'),
                        ),
                        DataColumn(
                          label: Text('Отчество'),
                        ),
                        DataColumn(
                          label: Text('Телефон'),
                        ),
                        DataColumn(
                          label: Text('Пароль'),
                        ),
                        DataColumn(
                          label: Text(''),
                        ),
                      ],
                      rows: state.listOperators
                          .where((element) => element.active)
                          .map((operator) {
                        return DataRow(
                          cells: <DataCell>[
                            DataCell(Text(operator.firstName)),
                            DataCell(Text(operator.secondName)),
                            DataCell(Text(operator.surname)),
                            DataCell(Text(operator.phone)),
                            DataCell(Password(password: operator.password)),
                            DataCell(TextButton(
                              child: Text('Удалить'),
                              onPressed: () {
                                setState(() {
                                  BlocProvider.of<OperatorsBloc>(context)
                                      .add(DeleteOperators(id: operator.id));
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popper/constants.dart';
import 'package:popper/screen/tasks/bloc/dataTable_event.dart';
import 'package:popper/screen/tasks/bloc/datatable_bloc.dart';
import 'package:popper/widgets/field.dart';

class NewTaskForm extends StatefulWidget {
  const NewTaskForm({Key? key}) : super(key: key);

  @override
  _NewTaskFormState createState() => _NewTaskFormState();
}

class _NewTaskFormState extends State<NewTaskForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController countController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    countController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 280.0,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0, right: 8.0, left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Field(
                    controller: nameController,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Поле "Имя" не было заполнено'
                        : null,
                    hintText: 'Введите имя',
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Field(
                    controller: numberController,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Поле "Номер" не было заполнено'
                        : null,
                    hintText: 'Введите номер',
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Field(
                    controller: countController,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Поле "Общее количество" не было заполнено'
                        : null,
                    hintText: 'Введите общее количество',
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'Добавить',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: secondaryColor),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('button pressed');
                        BlocProvider.of<DataTableBloc>(context)
                          ..add(
                            CreateNewTask(
                              nameOfTask: nameController.text,
                              numberOfTask: numberController.text,
                              totalNumber: int.parse(countController.text),
                            ),
                          );
                        nameController.clear();
                        numberController.clear();
                        countController.clear();
                      }
                    },
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

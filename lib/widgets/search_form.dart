import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popper/screen/tasks/bloc/dataTable_event.dart';
import 'package:popper/screen/tasks/bloc/datatable_bloc.dart';
import 'field.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController searchingController = TextEditingController();

  @override
  void initState() {
    searchingController.addListener(() {
      BlocProvider.of<DataTableBloc>(context)
        ..add(
          UseFilter(
            filterWord: searchingController.text,
          ),
        );
      // countController.clear();
    });
  }

  @override
  void dispose() {
    searchingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Form(
        key: _formKey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Field(
                  controller: searchingController,
                  validator: (value) =>
                      /*value == null || value.isEmpty
                      ? 'Поле не было заполнено'
                      : null*/
                      null,
                  hintText: 'Введите имя для поиска',
                ),
              ),
            ),
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: ElevatedButton(
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(vertical: 15),
            //           child: Text(
            //             'Применить',
            //             style: TextStyle(fontSize: 20),
            //           ),
            //         ),
            //         style: ButtonStyle(
            //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //             RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(12.0),
            //             ),
            //           ),
            //         ),
            //         onPressed: () {
            //           if (_formKey.currentState!.validate()) {
            //             print('button pressed');
            //             BlocProvider.of<DataTableBloc>(context)
            //               ..add(
            //                 UseFilter(
            //                   filterWord: searchingController.text,
            //                 ),
            //               );
            //             // countController.clear();
            //           }
            //         }),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

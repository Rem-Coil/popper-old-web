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
      BlocProvider.of<DataTableBloc>(context).add(
        UseFilter(filterWord: searchingController.text),
      );
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
                  validator: (value) => null,
                  hintText: 'Введите имя для поиска',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

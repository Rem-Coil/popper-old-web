import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popper/screen/tasks/bloc/dataTable_event.dart';
import 'package:popper/screen/tasks/bloc/datatable_bloc.dart';

class Header extends StatelessWidget {
  final String title;

  const Header({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20),
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(width: 50),
        Spacer(),
        IconButton(
          icon: Icon(Icons.replay),
          onPressed: () {
            BlocProvider.of<DataTableBloc>(context).add(ShowDataTable());
          },
        )
      ],
    );
  }
}

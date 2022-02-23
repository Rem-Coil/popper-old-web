import 'package:flutter/foundation.dart';

@immutable
class DataTableEvent {}

class ShowDataTable extends DataTableEvent {}

class CreateNewTask extends DataTableEvent {
  final String nameOfTask;
  final String numberOfTask;
  final int totalNumber;

  CreateNewTask(
      {required this.nameOfTask,
      required this.numberOfTask,
      required this.totalNumber});
}

class UseFilter extends DataTableEvent {
  final String filterWord;

  UseFilter({required this.filterWord});
}

class DeleteTask extends DataTableEvent {
  final int id;

  DeleteTask({required this.id});
}

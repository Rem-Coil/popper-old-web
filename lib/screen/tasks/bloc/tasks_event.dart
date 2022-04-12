import 'package:flutter/foundation.dart';

@immutable
class TasksEvent {}

class GetTasks extends TasksEvent {}

class CreateTask extends TasksEvent {
  final String nameOfTask;
  final String numberOfTask;
  final int totalNumber;

  CreateTask(
      {required this.nameOfTask,
      required this.numberOfTask,
      required this.totalNumber});
}

class UseFilter extends TasksEvent {
  final String filterWord;

  UseFilter({required this.filterWord});
}

class DeleteTask extends TasksEvent {
  final int id;

  DeleteTask({required this.id});
}

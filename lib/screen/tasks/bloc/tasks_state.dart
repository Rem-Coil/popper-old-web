import 'package:flutter/foundation.dart';
import 'package:popper/models/model.dart';

@immutable
class TasksState {
  final bool isLoad;
  final String? errorMessage;
  final List<TaskBobina> listBobinas;

  TasksState._(this.isLoad, this.errorMessage, this.listBobinas);

  factory TasksState.initial() => TasksState._(false, null, List.empty());

  TasksState load() => TasksState._(true, null, List.from(listBobinas));

  TasksState error(String errorMessage) =>
      TasksState._(false, errorMessage, List.from(listBobinas));

  TasksState updateTasks(List<TaskBobina> list) =>
      TasksState._(false, null, list);

  bool get hasError => errorMessage != null;
}

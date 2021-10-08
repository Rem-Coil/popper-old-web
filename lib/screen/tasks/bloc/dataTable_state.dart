import 'package:flutter/foundation.dart';
import 'package:popper/models/model.dart';

@immutable
class DataTableState {
  final bool isLoad;
  final String? errorMessage;
  final List<TaskBobina> listBobinas;

  DataTableState._(this.isLoad, this.errorMessage, this.listBobinas);

  factory DataTableState.initial() =>
      DataTableState._(false, null, List.empty());

  DataTableState load() => DataTableState._(true, null, List.from(listBobinas));

  DataTableState error(String errorMessage) =>
      DataTableState._(false, errorMessage, List.from(listBobinas));

  DataTableState create(List<TaskBobina> list) =>
      DataTableState._(false, null, list);

  DataTableState addTask(TaskBobina task) =>
      DataTableState._(false, null, List.from(listBobinas)..add(task));
}

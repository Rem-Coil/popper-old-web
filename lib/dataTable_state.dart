import 'package:flutter/foundation.dart';
import 'package:popper/model.dart';

@immutable
class DataTableState {
  final bool isLoad;
  final String? errorMessage;
  final List<TaskBobina> listBobinas;

  DataTableState._(this.isLoad, this.errorMessage, this.listBobinas);

  factory DataTableState.initial() =>
      DataTableState._(false, null, List.empty());

  DataTableState load() => DataTableState._(true, null, List.empty());

  DataTableState error(String errorMessage) =>
      DataTableState._(false, errorMessage, List.empty());

  DataTableState success(List<TaskBobina> newListBobinas) => DataTableState._(
      true, null, List.from(listBobinas)..addAll(newListBobinas));
}

import 'package:flutter/cupertino.dart';
import 'package:popper/models/final_info.dart';

@immutable
class TaskInformationState {
  final bool isLoad;
  final String? errorMessage;
  final List<FinalInfo> infoList;

  TaskInformationState._(this.isLoad, this.errorMessage, this.infoList);

  factory TaskInformationState.initial() =>
      TaskInformationState._(false, null, List.empty());

  TaskInformationState load() => TaskInformationState._(true, null, infoList);

  TaskInformationState error(String errorMessage) =>
      TaskInformationState._(false, errorMessage, infoList);

  TaskInformationState showInfo(List<FinalInfo> list) =>
      TaskInformationState._(false, null, list);

  bool get hasError => errorMessage != null;

  String? get err => errorMessage;
}

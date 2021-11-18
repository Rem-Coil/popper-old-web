import 'package:flutter/cupertino.dart';

@immutable
class TaskInformationEvent {}

class ShowTaskInformation extends TaskInformationEvent {
  final int id;

  ShowTaskInformation(this.id);
}

import 'package:flutter/cupertino.dart';

@immutable
class TaskInformationEvent {}

class ShowTaskInformation extends TaskInformationEvent {
  final String id;

  ShowTaskInformation(this.id);
}

import 'package:json_annotation/json_annotation.dart';

part 'added_task.g.dart';

@JsonSerializable()
class AddedTask {
  @JsonKey(name: 'task_name')
  final String taskName;
  @JsonKey(name: 'task_number')
  final String taskNumber;
  final int quantity;

  AddedTask({
    required this.taskName,
    required this.taskNumber,
    required this.quantity,
  });

  factory AddedTask.fromJson(Map<String, dynamic> json) =>
      _$AddedTaskFromJson(json);

  Map<String, dynamic> toJson() => _$AddedTaskToJson(this);
}

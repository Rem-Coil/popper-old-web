import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class TaskBobina {
  final int id;
  @JsonKey(name: 'task_name')
  final String taskName;
  @JsonKey(name: 'task_number')
  final String taskNumber;
  final int quantity;
  final int winding;
  final int output;
  final int isolation;
  final int molding;
  final int crimping;
  final int quality;
  final int testing;

  TaskBobina({
    this.id = -1,
    required this.taskName,
    required this.taskNumber,
    required this.quantity,
    this.winding = 0,
    this.output = 0,
    this.isolation = 0,
    this.molding = 0,
    this.crimping = 0,
    this.quality = 0,
    this.testing = 0,
  });

  factory TaskBobina.fromJson(Map<String, dynamic> json) =>
      _$TaskBobinaFromJson(json);

  Map<String, dynamic> toJson() => _$TaskBobinaToJson(this);
}

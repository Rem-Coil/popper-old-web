import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class TaskBobina {
  final String nameOfTask;
  final String numberOfTask;
  final int numberOfBobinas;
  final int winding;
  final int output;
  final int isolation;
  final int molding;
  final int crimping;
  final int quality;
  final int testing;

  TaskBobina({
    required this.nameOfTask,
    required this.numberOfTask,
    required this.numberOfBobinas,
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

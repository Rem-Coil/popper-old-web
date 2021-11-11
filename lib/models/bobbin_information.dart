import 'package:json_annotation/json_annotation.dart';

part 'bobbin_information.g.dart';

@JsonSerializable()
class BobbinInformation {
  final int id;
  @JsonKey(name: 'task_id')
  final int taskId;
  @JsonKey(name: 'bobbin_number')
  final String bobbinNumber;

  BobbinInformation({
    required this.id,
    required this.taskId,
    required this.bobbinNumber,
  });

  factory BobbinInformation.fromJson(Map<String, dynamic> json) =>
      _$BobbinInformationFromJson(json);

  Map<String, dynamic> toJson() => _$BobbinInformationToJson(this);
}

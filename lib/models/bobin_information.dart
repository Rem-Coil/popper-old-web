import 'package:json_annotation/json_annotation.dart';

part 'bobbin_information.g.dart';

@JsonSerializable()
class BobbinInformation {
  final int id;
  final int taskId;
  final String bobbinNumber;

  BobbinInformation({
    required this.id,
    required this.taskId,
    required this.bobbinNumber,
  });

  factory BobbinInformation.fromJson(Map<String, dynamic> json) =>
      _$BobinInformationFromJson(json);

  Map<String, dynamic> toJson() => _$BobinInformationToJson(this);
}

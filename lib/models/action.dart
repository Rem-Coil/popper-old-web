import 'package:json_annotation/json_annotation.dart';

part 'action.g.dart';

@JsonSerializable()
class Action {
  @JsonKey(name: 'bobbinId')
  final int bobbinId;
  @JsonKey(name: 'bobbin_number')
  final String bobbinNumber;
  @JsonKey(name: 'firstname')
  final String firstname;
  @JsonKey(name: 'second_name')
  final String secondName;
  final String surname;
  @JsonKey(name: 'action_type')
  final String actionType;
  @JsonKey(name: 'done_time')
  final String doneTime;
  final bool successful;

  Action({
    required this.bobbinId,
    required this.bobbinNumber,
    required this.firstname,
    required this.secondName,
    required this.surname,
    required this.actionType,
    required this.doneTime,
    required this.successful,
  });

  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);

  Map<String, dynamic> toJson() => _$ActionToJson(this);

  String get author => '$firstname $secondName';
}

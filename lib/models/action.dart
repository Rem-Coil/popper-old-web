import 'package:json_annotation/json_annotation.dart';

part 'action.g.dart';

@JsonSerializable()
class Action {
  final int bobbinId;
  final String bobbinNumber;
  final String firstname;
  @JsonKey(name: 'second_name')
  final String secondName;
  final String surname;
  final String actionType;
  final String doneTime;

  Action({
    required this.bobbinId,
    required this.bobbinNumber,
    required this.firstname,
    required this.secondName,
    required this.surname,
    required this.actionType,
    required this.doneTime,
  });

  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);

  Map<String, dynamic> toJson() => _$ActionToJson(this);

  String get author => '$surname $firstname';
}

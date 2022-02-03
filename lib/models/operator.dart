import 'package:json_annotation/json_annotation.dart';

part 'operator.g.dart';

@JsonSerializable()
class Operator {
  final int id;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'second_name')
  final String secondName;
  final String surname;
  final String phone;
  final String password;
  final bool active;

  Operator(
    this.id,
    this.firstName,
    this.secondName,
    this.surname,
    this.phone,
    this.password,
    this.active,
  );

  factory Operator.fromJson(Map<String, dynamic> json) =>
      _$OperatorFromJson(json);

  Map<String, dynamic> toJson() => _$OperatorToJson(this);
}

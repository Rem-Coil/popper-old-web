// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Operator _$OperatorFromJson(Map<String, dynamic> json) {
  return Operator(
    json['id'] as int,
    json['first_name'] as String,
    json['second_name'] as String,
    json['surname'] as String,
    json['phone'] as String,
    json['password'] as String,
    json['active'] as bool,
  );
}

Map<String, dynamic> _$OperatorToJson(Operator instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'second_name': instance.secondName,
      'surname': instance.surname,
      'phone': instance.phone,
      'password': instance.password,
      'active': instance.active,
    };

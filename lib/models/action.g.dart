// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Action _$ActionFromJson(Map<String, dynamic> json) {
  return Action(
    bobbinId: json['bobbin_id'] as int,
    bobbinNumber: json['bobbin_number'] as String,
    firstname: json['first_name'] as String,
    secondName: json['second_name'] as String,
    surname: json['surname'] as String,
    actionType: json['action_type'] as String,
    doneTime: json['done_time'] as String,
  );
}

Map<String, dynamic> _$ActionToJson(Action instance) => <String, dynamic>{
      'bobbin_id': instance.bobbinId,
      'bobbin_number': instance.bobbinNumber,
      'first_name': instance.firstname,
      'second_name': instance.secondName,
      'surname': instance.surname,
      'action_type': instance.actionType,
      'done_time': instance.doneTime,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Action _$ActionFromJson(Map<String, dynamic> json) {
  return Action(
    bobbinId: json['bobbinId'] as int,
    bobbinNumber: json['bobbin_number'] as String,
    firstname: json['firstname'] as String,
    secondName: json['second_name'] as String,
    surname: json['surname'] as String,
    actionType: json['action_type'] as String,
    doneTime: json['done_time'] as String,
  );
}

Map<String, dynamic> _$ActionToJson(Action instance) => <String, dynamic>{
      'bobbinId': instance.bobbinId,
      'bobbin_number': instance.bobbinNumber,
      'firstname': instance.firstname,
      'second_name': instance.secondName,
      'surname': instance.surname,
      'action_type': instance.actionType,
      'done_time': instance.doneTime,
    };

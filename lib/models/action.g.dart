// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Action _$ActionFromJson(Map<String, dynamic> json) {
  return Action(
    bobbinId: json['bobbinId'] as int,
    bobbinNumber: json['bobbinNumber'] as String,
    firstname: json['firstname'] as String,
    secondName: json['second_name'] as String,
    surname: json['surname'] as String,
    actionType: json['actionType'] as String,
    doneTime: json['doneTime'] as String,
  );
}

Map<String, dynamic> _$ActionToJson(Action instance) => <String, dynamic>{
      'bobbinId': instance.bobbinId,
      'bobbinNumber': instance.bobbinNumber,
      'firstname': instance.firstname,
      'second_name': instance.secondName,
      'surname': instance.surname,
      'actionType': instance.actionType,
      'doneTime': instance.doneTime,
    };

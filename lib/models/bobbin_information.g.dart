// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bobbin_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BobbinInformation _$BobbinInformationFromJson(Map<String, dynamic> json) {
  return BobbinInformation(
    id: json['id'] as int,
    taskId: json['task_id'] as int,
    bobbinNumber: json['bobbin_number'] as String,
  );
}

Map<String, dynamic> _$BobbinInformationToJson(BobbinInformation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'task_id': instance.taskId,
      'bobbin_number': instance.bobbinNumber,
    };

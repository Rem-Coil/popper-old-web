// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bobin_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BobbinInformation _$BobinInformationFromJson(Map<String, dynamic> json) {
  return BobbinInformation(
    id: json['id'] as int,
    taskId: json['taskId'] as int,
    bobbinNumber: json['bobbinNumber'] as String,
  );
}

Map<String, dynamic> _$BobinInformationToJson(BobbinInformation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'bobbinNumber': instance.bobbinNumber,
    };

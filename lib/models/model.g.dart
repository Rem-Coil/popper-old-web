// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskBobina _$TaskBobinaFromJson(Map<String, dynamic> json) {
  return TaskBobina(
    nameOfTask: json['nameOfTask'] as String,
    numberOfTask: json['numberOfTask'] as String,
    numberOfBobinas: json['numberOfBobinas'] as int,
    winding: json['winding'] as int,
    output: json['output'] as int,
    isolation: json['isolation'] as int,
    molding: json['molding'] as int,
    crimping: json['crimping'] as int,
    quality: json['quality'] as int,
    testing: json['testing'] as int,
  );
}

Map<String, dynamic> _$TaskBobinaToJson(TaskBobina instance) =>
    <String, dynamic>{
      'nameOfTask': instance.nameOfTask,
      'numberOfTask': instance.numberOfTask,
      'numberOfBobinas': instance.numberOfBobinas,
      'winding': instance.winding,
      'output': instance.output,
      'isolation': instance.isolation,
      'molding': instance.molding,
      'crimping': instance.crimping,
      'quality': instance.quality,
      'testing': instance.testing,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'added_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddedTask _$AddedTaskFromJson(Map<String, dynamic> json) {
  return AddedTask(
    taskName: json['task_name'] as String,
    taskNumber: json['task_number'] as String,
    quantity: json['quantity'] as int,
  );
}

Map<String, dynamic> _$AddedTaskToJson(AddedTask instance) => <String, dynamic>{
      'task_name': instance.taskName,
      'task_number': instance.taskNumber,
      'quantity': instance.quantity,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      start: json['start'] as String?,
      end: json['end'] as String?,
      doneDate: json['done_date'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      files: json['files'] as List<dynamic>?,
      mapObjects: json['map_objects'] as List<dynamic>?,
      performPercent: json['perform_percent'] as int?,
      order: json['order'] as int?,
      taskProjectId: json['task_project_id'] as int?,
      ownerId: json['owner_id'] as int?,
      priority: json['priority'] as String?,
      status: json['status'] as String?,
      parentTaskId: json['parent_task_id'] as int?,
      parentTaskName: json['parent_task_name'] as String?,
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'start': instance.start,
      'end': instance.end,
      'done_date': instance.doneDate,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'files': instance.files,
      'map_objects': instance.mapObjects,
      'perform_percent': instance.performPercent,
      'order': instance.order,
      'task_project_id': instance.taskProjectId,
      'owner_id': instance.ownerId,
      'priority': instance.priority,
      'status': instance.status,
      'parent_task_id': instance.parentTaskId,
      'parent_task_name': instance.parentTaskName,
    };

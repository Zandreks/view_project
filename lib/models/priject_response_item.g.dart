// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'priject_response_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectResponseItemModel _$ProjectResponseItemModelFromJson(
        Map<String, dynamic> json) =>
    ProjectResponseItemModel(
      data: json['data'] == null
          ? null
          : ProjectItemModel.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ProjectResponseItemModelToJson(
        ProjectResponseItemModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'message': instance.message,
    };

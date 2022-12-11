// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectResponseModel _$ProjectResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProjectResponseModel(
      data: json['data'] == null
          ? null
          : ProjectPaginationModel.fromJson(
              json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ProjectResponseModelToJson(
        ProjectResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'message': instance.message,
    };

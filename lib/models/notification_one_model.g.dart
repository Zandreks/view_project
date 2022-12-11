// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_one_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationOneModel _$NotificationOneModelFromJson(
        Map<String, dynamic> json) =>
    NotificationOneModel(
      json['data'] == null
          ? null
          : NotificationDataModel.fromJson(
              json['data'] as Map<String, dynamic>),
      json['success'] as bool?,
      json['message'] as String?,
    );

Map<String, dynamic> _$NotificationOneModelToJson(
        NotificationOneModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'message': instance.message,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentResponseModel _$CommentResponseModelFromJson(
        Map<String, dynamic> json) =>
    CommentResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CommentItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CommentResponseModelToJson(
        CommentResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'message': instance.message,
    };

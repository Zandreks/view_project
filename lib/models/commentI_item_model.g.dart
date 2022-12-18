// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commentI_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentItemModel _$CommentItemModelFromJson(Map<String, dynamic> json) =>
    CommentItemModel(
      id: json['id'] as int?,
      text: json['text'] as String?,
      project_id: json['project_id'] as int?,
      owner: json['owner'] == null
          ? null
          : OwnerModel.fromJson(json['owner'] as Map<String, dynamic>),
      child_comments: (json['child_comments'] as List<dynamic>?)
          ?.map((e) => CommentItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      parentId: json['parentId'],
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      deletedAt: json['deletedAt'],
    );

Map<String, dynamic> _$CommentItemModelToJson(CommentItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'project_id': instance.project_id,
      'owner': instance.owner,
      'child_comments': instance.child_comments,
      'parentId': instance.parentId,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deletedAt': instance.deletedAt,
    };

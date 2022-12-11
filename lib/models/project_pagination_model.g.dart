// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectPaginationModel _$ProjectPaginationModelFromJson(
        Map<String, dynamic> json) =>
    ProjectPaginationModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProjectItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: json['currentPage'] as int?,
      lastPage: json['lastPage'] as int?,
      perPage: json['perPage'] as String?,
      from: json['from'] as int?,
      to: json['to'] as int?,
      total: json['total'] as int?,
      nextPageUrl: json['nextPageUrl'] as String?,
      prevPageUrl: json['prevPageUrl'] as String?,
      firstPageUrl: json['firstPageUrl'] as String?,
      lastPageUrl: json['lastPageUrl'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$ProjectPaginationModelToJson(
        ProjectPaginationModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'currentPage': instance.currentPage,
      'lastPage': instance.lastPage,
      'perPage': instance.perPage,
      'from': instance.from,
      'to': instance.to,
      'total': instance.total,
      'nextPageUrl': instance.nextPageUrl,
      'prevPageUrl': instance.prevPageUrl,
      'firstPageUrl': instance.firstPageUrl,
      'lastPageUrl': instance.lastPageUrl,
      'path': instance.path,
    };

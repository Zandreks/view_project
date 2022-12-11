// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationPaginationModel _$NotificationPaginationModelFromJson(
        Map<String, dynamic> json) =>
    NotificationPaginationModel(
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => NotificationDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: json['currentPage'] as int?,
      lastPage: json['lastPage'] as int?,
      perPage: json['perPage'] as int?,
      from: json['from'] as int?,
      to: json['to'] as int?,
      total: json['total'] as int?,
      nextPageUrl: json['nextPageUrl'] as String?,
      prevPageUrl: json['prevPageUrl'] as String?,
      firstPageUrl: json['firstPageUrl'] as String?,
      lastPageUrl: json['lastPageUrl'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$NotificationPaginationModelToJson(
        NotificationPaginationModel instance) =>
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

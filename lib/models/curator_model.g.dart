// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CuratorModel _$CuratorModelFromJson(Map<String, dynamic> json) => CuratorModel(
      id: json['id'] as int?,
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      middleName: json['middle_name'] as String?,
      organizationId: json['organization_id'] as int?,
      organizationName: json['organization_name'] as String?,
    );

Map<String, dynamic> _$CuratorModelToJson(CuratorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'middle_name': instance.middleName,
      'organization_id': instance.organizationId,
      'organization_name': instance.organizationName,
    };

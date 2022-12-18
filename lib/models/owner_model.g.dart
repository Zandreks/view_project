// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnerModel _$OwnerModelFromJson(Map<String, dynamic> json) => OwnerModel(
      id: json['id'] as int?,
      first_name: json['first_name'] as String?,
      middle_name: json['middle_name'] as String?,
      last_name: json['last_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'],
      organizationId: json['organizationId'] as int?,
      organizationName: json['organizationName'] as String?,
      positionId: json['positionId'],
      positionName: json['positionName'],
      isCoordinator: json['isCoordinator'] as int?,
      role: json['role'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$OwnerModelToJson(OwnerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'middle_name': instance.middle_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'phone': instance.phone,
      'organizationId': instance.organizationId,
      'organizationName': instance.organizationName,
      'positionId': instance.positionId,
      'positionName': instance.positionName,
      'isCoordinator': instance.isCoordinator,
      'role': instance.role,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

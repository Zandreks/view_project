// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDataModel _$ProfileDataModelFromJson(Map<String, dynamic> json) =>
    ProfileDataModel(
      id: json['id'] as int?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
      organizationId: json['organizationId'] as int?,
      organizationName: json['organizationName'] as String?,
      positionId: json['positionId'] as int?,
      positionName: json['positionName'] as String?,
      isCoordinator: json['isCoordinator'] as int?,
      role: json['role'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ProfileDataModelToJson(ProfileDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'organizationId': instance.organizationId,
      'organizationName': instance.organizationName,
      'positionId': instance.positionId,
      'positionName': instance.positionName,
      'isCoordinator': instance.isCoordinator,
      'role': instance.role,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

import 'package:json_annotation/json_annotation.dart';
part 'profile_data_model.g.dart';

@JsonSerializable()
class ProfileDataModel{
  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? email;
  String? phone;
  String? avatar;
  int? organizationId;
  String? organizationName;
  int? positionId;
  String? positionName;
  int? isCoordinator;
  String? role;
  String? createdAt;
  String? updatedAt;

  ProfileDataModel(
      {this.id,
        this.firstName,
        this.middleName,
        this.lastName,
        this.email,
        this.phone,
        this.avatar,
        this.organizationId,
        this.organizationName,
        this.positionId,
        this.positionName,
        this.isCoordinator,
        this.role,
        this.createdAt,
        this.updatedAt});


  factory ProfileDataModel.fromJson(Map<String, dynamic> json) => _$ProfileDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileDataModelToJson(this);
}
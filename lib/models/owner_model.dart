
import 'package:json_annotation/json_annotation.dart';

part 'owner_model.g.dart';

@JsonSerializable()
class OwnerModel {
  int? id;
  String? first_name;
  String? middle_name;
  String? last_name;
  String? email;
  dynamic phone;
  int? organizationId;
  String? organizationName;
  dynamic positionId;
  dynamic positionName;
  int? isCoordinator;
  String? role;
  String? createdAt;
  String? updatedAt;

  OwnerModel({this.id,
    this.first_name,
    this.middle_name,
    this.last_name,
    this.email,
    this.phone,
    this.organizationId,
    this.organizationName,
    this.positionId,
    this.positionName,
    this.isCoordinator,
    this.role,
    this.createdAt,
    this.updatedAt});
  factory OwnerModel.fromJson(Map<String, dynamic> json) => _$OwnerModelFromJson(json);
  Map<String, dynamic> toJson() => _$OwnerModelToJson(this);
}

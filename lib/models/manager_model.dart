import 'package:json_annotation/json_annotation.dart';

part 'manager_model.g.dart';

@JsonSerializable()
class ManagerModel {
  int? id;
  String? email;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "middle_name")
  String? middleName;
  @JsonKey(name: "organization_id")
  int? organizationId;
  @JsonKey(name: "organization_name")
  String? organizationName;
  ManagerModel({this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.middleName,
    this.organizationId,
    this.organizationName});

  factory ManagerModel.fromJson(Map<String, dynamic> json) => _$ManagerModelFromJson(json);
  Map<String, dynamic> toJson() => _$ManagerModelToJson(this);
}
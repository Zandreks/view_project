import 'package:json_annotation/json_annotation.dart';

part 'member_model.g.dart';

@JsonSerializable()
class MemberModel{
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

  MemberModel({this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.middleName,
    this.organizationId,
    this.organizationName});
  factory MemberModel.fromJson(Map<String, dynamic> json) => _$MemberModelFromJson(json);
  Map<String, dynamic> toJson() => _$MemberModelToJson(this);
}
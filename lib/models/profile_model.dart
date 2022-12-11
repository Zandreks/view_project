import 'package:json_annotation/json_annotation.dart';
import 'package:view_project/models/profile_data_model.dart';
part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel{
  ProfileDataModel? data;
  bool? success;
  String? message;

  ProfileModel({this.data, this.success, this.message});
  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
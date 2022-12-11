import 'package:json_annotation/json_annotation.dart';
import 'package:view_project/models/project_pagination_model.dart';
part 'project_response_model.g.dart';

@JsonSerializable()
class ProjectResponseModel {
  ProjectPaginationModel? data;
  bool? success;
  String? message;

  ProjectResponseModel({this.data, this.success, this.message});
  factory ProjectResponseModel.fromJson(Map<String, dynamic> json) => _$ProjectResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectResponseModelToJson(this);
}

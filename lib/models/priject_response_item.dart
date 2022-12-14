import 'package:json_annotation/json_annotation.dart';
import 'package:view_project/models/project_item_model.dart';
part 'priject_response_item.g.dart';

@JsonSerializable()
class ProjectResponseItemModel {
  ProjectItemModel? data;
  bool? success;
  String? message;

  factory ProjectResponseItemModel.fromJson(Map<String, dynamic> json) => _$ProjectResponseItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectResponseItemModelToJson(this);

  ProjectResponseItemModel(
      {this.data, this.success, this.message});
}
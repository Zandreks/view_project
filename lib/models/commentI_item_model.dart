
import 'package:json_annotation/json_annotation.dart';
import 'package:view_project/models/owner_model.dart';

part 'commentI_item_model.g.dart';

@JsonSerializable()
class CommentItemModel {
  int? id;
  String? text;
  int? project_id;
  OwnerModel? owner;
  List<CommentItemModel>? child_comments;
  dynamic parentId;
  String? created_at;
  String? updated_at;
  dynamic deletedAt;

  CommentItemModel({this.id,
    this.text,
    this.project_id,
    this.owner,
    this.child_comments,
    this.parentId,
    this.created_at,
    this.updated_at,
    this.deletedAt});
  factory CommentItemModel.fromJson(Map<String, dynamic> json) => _$CommentItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentItemModelToJson(this);
}
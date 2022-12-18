import 'package:json_annotation/json_annotation.dart';
import 'package:view_project/models/commentI_item_model.dart';

part 'comment_response_model.g.dart';

@JsonSerializable()
class CommentResponseModel {
  List<CommentItemModel>? data;
  bool? success;
  String? message;

  CommentResponseModel({this.data, this.success, this.message});

  factory CommentResponseModel.fromJson(Map<String, dynamic> json) => _$CommentResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentResponseModelToJson(this);
}
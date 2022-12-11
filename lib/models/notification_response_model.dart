import 'package:json_annotation/json_annotation.dart';
import 'package:view_project/models/notification_pagination_model.dart';
part 'notification_response_model.g.dart';

@JsonSerializable()
class NotificationResponseModel {
  NotificationPaginationModel? data;
  bool? success;
  String? message;

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) => _$NotificationResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationResponseModelToJson(this);

  NotificationResponseModel(
      {this.data, this.success, this.message});
}
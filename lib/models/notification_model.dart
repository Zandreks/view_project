import 'package:json_annotation/json_annotation.dart';

import 'notification_data_model.dart';
part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel{
  List<NotificationDataModel> data;
  bool? success;
  String? message;
  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);

  NotificationModel(this.data, this.success, this.message);
}
import 'package:json_annotation/json_annotation.dart';

import 'notification_data_model.dart';
part 'notification_one_model.g.dart';

@JsonSerializable()
class NotificationOneModel{
  NotificationDataModel? data;
  bool? success;
  String? message;
  factory NotificationOneModel.fromJson(Map<String, dynamic> json) => _$NotificationOneModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationOneModelToJson(this);

  NotificationOneModel(this.data, this.success, this.message);
}
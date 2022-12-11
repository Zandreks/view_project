import 'package:json_annotation/json_annotation.dart';
part 'notification_data_model.g.dart';

@JsonSerializable()
class NotificationDataModel{
  int? id;
  String? name;
  String? description;
  @JsonKey(name: "user_id")
  int? userId;
  String? status;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;


  factory NotificationDataModel.fromJson(Map<String, dynamic> json) => _$NotificationDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationDataModelToJson(this);

  NotificationDataModel(this.id, this.name, this.description, this.userId,
      this.status, this.createdAt, this.updatedAt);
}
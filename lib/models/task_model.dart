import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel{
  int? id;
  String? name;
  String? description;
  String? start;
  String? end;
  @JsonKey(name: "done_date")
  dynamic doneDate;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  List? files;
  @JsonKey(name: "map_objects")
  List? mapObjects;
  @JsonKey(name: "perform_percent")
  int? performPercent;
  int? order;
  @JsonKey(name: "task_project_id")
  int? taskProjectId;
  @JsonKey(name: "owner_id")
  int? ownerId;
  String? priority;
  String? status;
  @JsonKey(name: "parent_task_id")
  int? parentTaskId;
  @JsonKey(name: "parent_task_name")
  String? parentTaskName;

  TaskModel(
      {this.id,
        this.name,
        this.description,
        this.start,
        this.end,
        this.doneDate,
        this.createdAt,
        this.updatedAt,
        this.files,
        this.mapObjects,
        this.performPercent,
        this.order,
        this.taskProjectId,
        this.ownerId,
        this.priority,
        this.status,
        this.parentTaskId,
        this.parentTaskName});
  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);
  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}
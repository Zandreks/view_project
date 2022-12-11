import 'package:json_annotation/json_annotation.dart';
import 'package:view_project/models/curator_model.dart';
import 'package:view_project/models/manager_model.dart';
import 'package:view_project/models/member_model.dart';
import 'package:view_project/models/task_model.dart';
part 'project_item_model.g.dart';

@JsonSerializable()
class ProjectItemModel {
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
  @JsonKey(name: "perform_percent")
  int? performPercent;
  String? status;
  @JsonKey(name: "project_type")
  String? projectType;
  @JsonKey(name: "middle_point")
  String? middlePoint;
  int? avatar;
  @JsonKey(name: "avatar_src")
  String? avatarSrc;
  @JsonKey(name: "first_name")
  int? ownerId;
  List<TaskModel>? tasks;
  @JsonKey(name: "all_tasks_count")
  int? allTasksCount;
  @JsonKey(name: "my_tasks_count")
  int? myTasksCount;
  @JsonKey(name: "done_tasks_count")
  int? doneTasksCount;
  List<ManagerModel>? managers;
  List<MemberModel>? members;
  List<CuratorModel>? curators;
  List? files;
  @JsonKey(name: "fin_sum")
  int? finSum;
  @JsonKey(name: "fin_source")
  List<String>? finSource;
  @JsonKey(name: "fin_source_sum_local_budget")
  String? finSourceSumLocalBudget;
  @JsonKey(name: "fin_source_sum_other")
  String? finSourceSumOther;
  String? zu;
  @JsonKey(name: "zu_number")
  String? zuNumber;
  @JsonKey(name: "zu_file_id")
  String? zuFileId;
  String? psd;
  @JsonKey(name: "psd_number")
  String? psdNumber;
  @JsonKey(name: "psd_file_id")
  String? psdFileId;
  String? gip;
  @JsonKey(name: "gip_number")
  String? gipNumber;
  @JsonKey(name: "gip_file_id")
  String? gipFileId;
  String? feo;
  @JsonKey(name: "feo_number")
  String? feoNumber;
  @JsonKey(name: "feo_file_id")
  String? feoFileId;
  @JsonKey(name: "business_plan")
  String? businessPlan;
  @JsonKey(name: "business_plan_file_id")
  String? businessPlanFileId;
  @JsonKey(name: "fin_econom")
  String? finEconom;
  @JsonKey(name: "marketing_plan")
  String? marketingPlan;

  ProjectItemModel(
      {this.id,
        this.name,
        this.description,
        this.start,
        this.end,
        this.doneDate,
        this.createdAt,
        this.updatedAt,
        this.performPercent,
        this.status,
        this.projectType,
        this.middlePoint,
        this.avatar,
        this.avatarSrc,
        this.ownerId,
        this.tasks,
        this.allTasksCount,
        this.myTasksCount,
        this.doneTasksCount,
        this.managers,
        this.members,
        this.curators,
        this.files,
        this.finSum,
        this.finSource,
        this.finSourceSumLocalBudget,
        this.finSourceSumOther,
        this.zu,
        this.zuNumber,
        this.zuFileId,
        this.psd,
        this.psdNumber,
        this.psdFileId,
        this.gip,
        this.gipNumber,
        this.gipFileId,
        this.feo,
        this.feoNumber,
        this.feoFileId,
        this.businessPlan,
        this.businessPlanFileId,
        this.finEconom,
        this.marketingPlan});
  factory ProjectItemModel.fromJson(Map<String, dynamic> json) => _$ProjectItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectItemModelToJson(this);
}
import 'package:json_annotation/json_annotation.dart';
import 'package:view_project/models/curator_model.dart';
import 'package:view_project/models/file_model.dart';
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
  String? gprt;
  String? gprt_number;
  String? gprt_comment;
  String? dkz;
  String? dkz_number;
  String? dkz_comment;
  String? teo;
  String? teo_number;
  String? teo_comment;
  String? psd;
  String? psd_number;
  String? psd_comment;
  String? competitive;
  String? competitive_comment;
  String? smr;
  String? smr_comment;
  String? budget;
  String? budget_status;
  String? budget_comment;
  String? budget_status_comment;

  String? zu;
  String? zu_number;
  String? zu_comment;
  String? gip;
  String? gip_number;
  String? gip_comment;
  String? feo;
  String? feo_number;
  String? feo_comment;
  String? business_plan;
  String? business_plan_comment;
  String? fin_econom;
  String? fin_econom_comment;
  String? marketing_plan;
  String? marketing_plan_comment;

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
  List<FileModel>? files;
  @JsonKey(name: "fin_sum")
  int? finSum;
  @JsonKey(name: "fin_source")
  List<String>? finSource;
  @JsonKey(name: "fin_source_sum_local_budget")
  String? finSourceSumLocalBudget;
  @JsonKey(name: "fin_source_sum_other")
  String? finSourceSumOther;
  @JsonKey(name: "zu_file_id")
  String? zuFileId;
  @JsonKey(name: "psd_file_id")
  String? psdFileId;
  @JsonKey(name: "gip_file_id")
  String? gipFileId;
  @JsonKey(name: "feo_file_id")
  String? feoFileId;
  @JsonKey(name: "business_plan_file_id")
  String? businessPlanFileId;
  @JsonKey(name: "comment_count")
  int? commentCount;

  ProjectItemModel({this.id,
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
    this.zu_number,
    this.zu_comment,
    this.zuFileId,
    this.psd,
    this.psdFileId,
    this.gip,
    this.gip_number,
    this.gip_comment,
    this.gipFileId,
    this.feo,
    this.feo_number,
    this.feo_comment,
    this.feoFileId,
    this.businessPlanFileId,
    this.fin_econom,
    this.fin_econom_comment,
    this.gprt,
    this.gprt_comment,
    this.gprt_number,
    this.dkz,
    this.dkz_comment,
    this.dkz_number,
    this.teo,
    this.teo_comment,
    this.teo_number,
    this.psd_comment,
    this.psd_number,
    this.budget,
    this.budget_status,
    this.budget_status_comment,
    this.budget_comment,
    this.competitive,
    this.competitive_comment,
    this.smr,
    this.smr_comment,
    this.business_plan,
    this.business_plan_comment,
    this.marketing_plan,
    this.marketing_plan_comment,
    this.commentCount});

  factory ProjectItemModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectItemModelToJson(this);
}

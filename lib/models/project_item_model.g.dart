// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectItemModel _$ProjectItemModelFromJson(Map<String, dynamic> json) =>
    ProjectItemModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      start: json['start'] as String?,
      end: json['end'] as String?,
      doneDate: json['done_date'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      performPercent: json['perform_percent'] as int?,
      status: json['status'] as String?,
      projectType: json['project_type'] as String?,
      middlePoint: json['middle_point'] as String?,
      avatar: json['avatar'] as int?,
      avatarSrc: json['avatar_src'] as String?,
      ownerId: json['first_name'] as int?,
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      allTasksCount: json['all_tasks_count'] as int?,
      myTasksCount: json['my_tasks_count'] as int?,
      doneTasksCount: json['done_tasks_count'] as int?,
      managers: (json['managers'] as List<dynamic>?)
          ?.map((e) => ManagerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => MemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      curators: (json['curators'] as List<dynamic>?)
          ?.map((e) => CuratorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      files: json['files'] as List<dynamic>?,
      finSum: json['fin_sum'] as int?,
      finSource: (json['fin_source'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      finSourceSumLocalBudget: json['fin_source_sum_local_budget'] as String?,
      finSourceSumOther: json['fin_source_sum_other'] as String?,
      zu: json['zu'] as String?,
      zuNumber: json['zu_number'] as String?,
      zuFileId: json['zu_file_id'] as String?,
      psd: json['psd'] as String?,
      psdNumber: json['psd_number'] as String?,
      psdFileId: json['psd_file_id'] as String?,
      gip: json['gip'] as String?,
      gipNumber: json['gip_number'] as String?,
      gipFileId: json['gip_file_id'] as String?,
      feo: json['feo'] as String?,
      feoNumber: json['feo_number'] as String?,
      feoFileId: json['feo_file_id'] as String?,
      businessPlan: json['business_plan'] as String?,
      businessPlanFileId: json['business_plan_file_id'] as String?,
      finEconom: json['fin_econom'] as String?,
      marketingPlan: json['marketing_plan'] as String?,
    );

Map<String, dynamic> _$ProjectItemModelToJson(ProjectItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'start': instance.start,
      'end': instance.end,
      'done_date': instance.doneDate,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'perform_percent': instance.performPercent,
      'status': instance.status,
      'project_type': instance.projectType,
      'middle_point': instance.middlePoint,
      'avatar': instance.avatar,
      'avatar_src': instance.avatarSrc,
      'first_name': instance.ownerId,
      'tasks': instance.tasks,
      'all_tasks_count': instance.allTasksCount,
      'my_tasks_count': instance.myTasksCount,
      'done_tasks_count': instance.doneTasksCount,
      'managers': instance.managers,
      'members': instance.members,
      'curators': instance.curators,
      'files': instance.files,
      'fin_sum': instance.finSum,
      'fin_source': instance.finSource,
      'fin_source_sum_local_budget': instance.finSourceSumLocalBudget,
      'fin_source_sum_other': instance.finSourceSumOther,
      'zu': instance.zu,
      'zu_number': instance.zuNumber,
      'zu_file_id': instance.zuFileId,
      'psd': instance.psd,
      'psd_number': instance.psdNumber,
      'psd_file_id': instance.psdFileId,
      'gip': instance.gip,
      'gip_number': instance.gipNumber,
      'gip_file_id': instance.gipFileId,
      'feo': instance.feo,
      'feo_number': instance.feoNumber,
      'feo_file_id': instance.feoFileId,
      'business_plan': instance.businessPlan,
      'business_plan_file_id': instance.businessPlanFileId,
      'fin_econom': instance.finEconom,
      'marketing_plan': instance.marketingPlan,
    };

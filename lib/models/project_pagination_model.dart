import 'package:json_annotation/json_annotation.dart';
import 'package:view_project/models/project_item_model.dart';
part 'project_pagination_model.g.dart';

@JsonSerializable()
class ProjectPaginationModel{
  List<ProjectItemModel>? data;
  int? currentPage;
  int? lastPage;
  String? perPage;
  int? from;
  int? to;
  int? total;
  String? nextPageUrl;
  String? prevPageUrl;
  String? firstPageUrl;
  String? lastPageUrl;
  String? path;

  ProjectPaginationModel(
      {this.data,
        this.currentPage,
        this.lastPage,
        this.perPage,
        this.from,
        this.to,
        this.total,
        this.nextPageUrl,
        this.prevPageUrl,
        this.firstPageUrl,
        this.lastPageUrl,
        this.path});
  factory ProjectPaginationModel.fromJson(Map<String, dynamic> json) => _$ProjectPaginationModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectPaginationModelToJson(this);
}
import 'package:view_project/models/notification_data_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'notification_pagination_model.g.dart';

@JsonSerializable()
class NotificationPaginationModel {
  List<NotificationDataModel>? data;
  int? currentPage;
  int? lastPage;
  int? perPage;
  int? from;
  int? to;
  int? total;
  String? nextPageUrl;
  String? prevPageUrl;
  String? firstPageUrl;
  String? lastPageUrl;
  String? path;

  NotificationPaginationModel({this.data,
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

  factory NotificationPaginationModel.fromJson(Map<String, dynamic> json) => _$NotificationPaginationModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationPaginationModelToJson(this);

}
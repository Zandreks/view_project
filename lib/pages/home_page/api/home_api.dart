import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:view_project/models/commentI_item_model.dart';
import 'package:view_project/models/comment_response_model.dart';
import 'package:view_project/models/priject_response_item.dart';
import 'package:view_project/models/project_item_model.dart';

import '../../../_helpers/global_snackbar.dart';
import '../../../_helpers/http_service.dart';
import '../../../models/project_pagination_model.dart';
import '../../../models/project_response_model.dart';

class HomeApi {
  static Future<ProjectPaginationModel?> getProjectApi(int page) async {
    try {
      HttpService httpService = HttpService();
      Dio dio = await httpService.init();
      final Response response =
      await dio.get("v1/projects/paginated?page=$page");
      ProjectResponseModel responseData =
      ProjectResponseModel.fromJson(response.data);
      return responseData.data;
    } catch (error) {
      GlobalSnackBar.error(tr("home_page_error_lod_project"));
    }
    return null;
  }

  static Future<ProjectItemModel?> getProjectItemApi(int id) async {
    try {
      HttpService httpService = HttpService();
      Dio dio = await httpService.init();
      final Response response =
      await dio.get("v1/projects/$id");
      ProjectResponseItemModel responseData =
      ProjectResponseItemModel.fromJson(response.data);
      return responseData.data;
    } catch (error) {
      GlobalSnackBar.error(tr("home_page_error_lod_project_item"));
    }
    return null;
  }
  static Future<List<CommentItemModel>?> getCommentListApi(int id) async {
    try {
      HttpService httpService = HttpService();
      Dio dio = await httpService.init();
      final Response response =
      await dio.get("v1/project-comments/project/$id");
      CommentResponseModel responseData =
      CommentResponseModel.fromJson(response.data);
      return responseData.data;
    } catch (error) {
      GlobalSnackBar.error(tr("home_page_error_loadComment"));
    }
    return null;
  }
  static Future<bool> addCommentApi(data) async {
    try {
      HttpService httpService = HttpService();
      Dio dio = await httpService.init();
      await dio.post("v1/project-comments",data: data);

      return true;
    } catch (error) {
      GlobalSnackBar.error(tr("home_page_error_addComment"));
    }
    return false;
  }
}
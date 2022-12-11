import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:view_project/models/notification_data_model.dart';
import 'package:view_project/models/notification_model.dart';
import 'package:view_project/models/notification_pagination_model.dart';
import 'package:view_project/models/notification_response_model.dart';

import '../../../_helpers/global_snackbar.dart';
import '../../../_helpers/http_service.dart';
import '../../../models/notification_one_model.dart';

class NotificationApi {
  static Future<NotificationModel?> getNotificationUnReadApi() async {
    try {
      HttpService httpService = HttpService();
      Dio dio = await httpService.init();
      final Response response = await dio.get("v1/notification/unread");
      NotificationModel responseData =
          NotificationModel.fromJson(response.data);
      return responseData;
    } catch (error) {
      GlobalSnackBar.error(tr("notification_error_load"));
    }
    return null;
  }

  static Future<NotificationPaginationModel?> getNotificationApi(page) async {
    try {
      HttpService httpService = HttpService();
      Dio dio = await httpService.init();
      final Response response = await dio.get("v1/notification/?page=$page");
      NotificationResponseModel responseData =
          NotificationResponseModel.fromJson(response.data);
      return responseData.data;
    } catch (error) {
      GlobalSnackBar.error(tr("notification_error_load"));
    }
    return null;
  }

  static Future<NotificationDataModel?> readNotificationApi(id, status) async {
    try {
      HttpService httpService = HttpService();
      Dio dio = await httpService.init();
      final Response response = await dio.put("v1/notification/$id", data: {});
      NotificationOneModel responseData =
          NotificationOneModel.fromJson(response.data);
      if (status == "unread") {
        GlobalSnackBar.info(tr("notification_read"));
      } else {
        GlobalSnackBar.info(tr("notification_unread"));
      }

      return responseData.data;
    } catch (error) {
      if (status == "unread") {
        GlobalSnackBar.error(tr("notification_read_error"));
      } else {
        GlobalSnackBar.error(tr("notification_unread_error"));
      }
    }
    return null;
  }
  static Future<bool> removeNotificationApi(id) async {
    try {
      HttpService httpService = HttpService();
      Dio dio = await httpService.init();
      await dio.delete("v1/notification/$id");
      GlobalSnackBar.info(tr("notification_remove"));

      return true;
    } catch (error) {
      GlobalSnackBar.error(tr("notification_remove_error"));
    }
    return false;
  }
}

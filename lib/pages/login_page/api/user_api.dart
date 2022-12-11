import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:view_project/models/profile_data_model.dart';
import 'package:view_project/models/profile_model.dart';
import 'package:view_project/models/token_model.dart';

import '../../../_helpers/global_snackbar.dart';
import '../../../_helpers/http_service.dart';

class UserApi {
  static Future<TokenModel?> loginApi(String username, String password) async {
    try {
      HttpService httpService = HttpService();
      Dio dio = await httpService.init();
      final Response response = await dio.post("sanctum/token",
          data: {"email": username, "password": password});
      TokenModel responseData = TokenModel.fromJson(response.data);
      return responseData;
    } catch (error) {
      GlobalSnackBar.error(tr("user_error_login"));
    }
    return null;
  }

  static Future<ProfileDataModel?> profileApi() async {
    try {
      HttpService httpService = HttpService();
      Dio dio = await httpService.init();
      final Response response = await dio.get("v1/profile");
      ProfileModel responseData = ProfileModel.fromJson(response.data);
      return responseData.data;
    } catch (error) {
      GlobalSnackBar.error(tr("user_error_profile"));
    }
    return null;
  }
  static Future<bool> logoutApi() async {
    try {
      HttpService httpService = HttpService();
      Dio dio = await httpService.init();
      await dio.get("v1/logout");
      return true;
    } catch (error) {
      GlobalSnackBar.error(tr("user_error_logout"));
    }
    return false;
  }
  static Future<bool> removeUserApi(int id) async {
    try {
      HttpService httpService = HttpService();
      Dio dio = await httpService.init();
      await dio.delete("v1/user/$id");
      return true;
    } catch (error) {
      GlobalSnackBar.error(tr("user_error_remove"));
    }
    return false;
  }
}

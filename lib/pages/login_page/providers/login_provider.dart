import 'package:logger/logger.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:view_project/models/profile_data_model.dart';
import 'package:view_project/models/token_model.dart';
import 'package:view_project/pages/login_page/api/user_api.dart';

class LoginProvider with ChangeNotifier {
  Logger logger = Logger();
  ProfileDataModel? _userProfile = null;
  bool showModalDeleteUser = false;
  ProfileDataModel? get userProfile => _userProfile;
  void setShouModal(){
    showModalDeleteUser = !showModalDeleteUser;
    notifyListeners();
  }
  set userProfile(ProfileDataModel? value) {
    _userProfile = value;
    notifyListeners();
  }

  bool _loadingForm = false;
  bool _loadingProfile = true;

  bool get loadingProfile => _loadingProfile;

  set loadingProfile(bool value) {
    _loadingProfile = value;
    notifyListeners();
  }

  bool? _savePassword = true;

  bool? get savePassword => _savePassword;

  set savePassword(bool? value) {
    _savePassword = value;
    notifyListeners();
  }

  bool get loadingForm => _loadingForm;

  set loadingForm(bool value) {
    _loadingForm = value;
    notifyListeners();
  }

  bool _showPass = false;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  bool get showPass => _showPass;

  set showPass(bool value) {
    _showPass = value;
    notifyListeners();
  }

  void setShowPassword(bool val) {
    showPass = val;
  }

  void setSavePassword(bool? val) {
    savePassword = val;
  }
  Future<void> setForm (BuildContext context)async{
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getString("savePassword")!= null){
      passwordController.text = prefs.getString("savePassword")!;
    }
    if(prefs.getString("saveEmail")!= null){
      userNameController.text = prefs.getString("saveEmail")!;
    }
  }
  Future<void> login(BuildContext context) async {
    try {
      loadingForm = true;
      final prefs = await SharedPreferences.getInstance();
      TokenModel? response = await UserApi.loginApi(
          userNameController.text, passwordController.text);
      if (response != null) {
        await prefs.setString('accessToken', response.token ?? '');
        await getProfile(context, true);
      }
    } catch (error) {
      logger.i(error);
    } finally {
      loadingForm = false;
    }
  }

  Future<void> getProfile(BuildContext context, [bool isLogin = false]) async {
    try {
      if (!isLogin) {
        loadingProfile = true;
      }
      ProfileDataModel? response = await UserApi.profileApi();
      if (response != null) {
        userProfile = response;
        notifyListeners();
        Navigator.pushNamedAndRemoveUntil(context, "/home", (r) => false);
      } else {
        String? route = ModalRoute.of(context)?.settings.name;
        if (route != null && route != "/login") {
          Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
        }
      }
    } catch (error) {
      logger.i(error);
    } finally {
      loadingProfile = false;
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      // bool response = await UserApi.logoutApi();
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('accessToken');
      userProfile = null;
      Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
    } catch (error) {
      logger.i(error);
    }
  }
  Future<void> removeUser(BuildContext context) async {
    try {
      bool response = await UserApi.removeUserApi(userProfile!.id!);
      if(response){
        await logout(context);
      }
    } catch (error) {
      logger.i(error);
    }
  }
}

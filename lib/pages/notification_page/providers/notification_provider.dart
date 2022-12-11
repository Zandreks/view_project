import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:view_project/models/notification_model.dart';
import 'package:view_project/models/notification_pagination_model.dart';
import 'package:view_project/pages/notification_page/api/notification_api.dart';

import '../../../models/notification_data_model.dart';

class NotificationProvider extends ChangeNotifier {
  Logger logger = Logger();
  ScrollController controller = ScrollController();
  bool loadingFirstPage = true;
  bool loadingPage = false;
  bool hasNextPage = true;
  int pageNumber = 1;
  int totalCount = 0;
  bool isNotificationUnread = false;

  List<NotificationDataModel> _notificationUnread = [];
  List<NotificationDataModel> _notificationList = [];

  List<NotificationDataModel> get notificationList => _notificationList;

  set notificationList(List<NotificationDataModel> value) {
    _notificationList = value;
    notifyListeners();
  }

  List<NotificationDataModel> _notificationListFilter = [];

  List<NotificationDataModel> get notificationListFilter =>
      _notificationListFilter;

  set notificationListFilter(List<NotificationDataModel> value) {
    _notificationListFilter = value;
    notifyListeners();
  }

  List<NotificationDataModel> get notificationUnread => _notificationUnread;

  set notificationUnread(List<NotificationDataModel> value) {
    _notificationUnread = value;
    notifyListeners();
  }

  void setUnreadNotification() {
    isNotificationUnread = !isNotificationUnread;
    notifyListeners();
    notificationUnreadFilter();

  }
  void clearState() {
    loadingFirstPage = true;
    loadingPage = false;
    hasNextPage = true;
    isNotificationUnread=false;
    pageNumber = 1;
    totalCount = 0;
    notificationList = [];
    notificationListFilter = [];
    controller.removeListener(loadNotificationNextPage);
  }
  Future<void> getNotificationUnread() async {
    try {
      NotificationModel? res = await NotificationApi.getNotificationUnReadApi();
      if (res != null) {
        notificationUnread = res.data;
      }
    } catch (error) {
      logger.i(error);
    }
  }

  Future<void> getNotification() async {
    try {
      NotificationPaginationModel? res =
          await NotificationApi.getNotificationApi(pageNumber);
      if (res != null) {
        totalCount = res.total!;
        notificationList = res.data!;
        notificationListFilter = res.data!;
        controller.addListener(() => loadNotificationNextPage());
        pageNumber = pageNumber + 1;
        notifyListeners();
      }
    } catch (error) {
      logger.i(error);
    }finally {
      loadingFirstPage = false;
      notifyListeners();
    }
  }

  Future<void> loadNotificationNextPage() async {
    if (hasNextPage == true &&
        loadingFirstPage == false &&
        loadingPage == false &&
        controller.position.extentAfter < 300) {
      loadingPage = true;
      notifyListeners();
      try {
        NotificationPaginationModel? res =
            await NotificationApi.getNotificationApi(pageNumber);

        if (res != null) {
          List<NotificationDataModel> copyResponse = [...?res.data];
          notificationList = [...notificationList, ...copyResponse];
          notificationListFilter = [...notificationList, ...copyResponse];
          notificationUnreadFilter();
          pageNumber = pageNumber + 1;
          if (totalCount <= notificationList.length) {
            hasNextPage = false;
          }
        }
      } catch (error) {
        logger.i(error);
      }finally {
        loadingPage = false;
        notifyListeners();
      }
    }
  }
  void notificationUnreadFilter(){
    if(isNotificationUnread){
      List<NotificationDataModel> copy = [...notificationList];
      notificationListFilter = copy.where((i) => i.status == "unread").toList();
    }else{
      notificationListFilter = notificationList;
    }
  }

  Future<void> readNotification(int id,String status) async {
    try {
      NotificationDataModel? res = await NotificationApi.readNotificationApi(id, status);
      if (res != null) {
        int indexListNotification = notificationList.indexWhere((element) => element.id == res.id);
        int indexListNotificationFilter = notificationListFilter.indexWhere((element) => element.id == res.id);
        if(indexListNotification != -1 && indexListNotificationFilter != -1){
          List<NotificationDataModel> copyList  = [...notificationList];
          List<NotificationDataModel> copyListFilter  = [...notificationListFilter];
          copyList[indexListNotification]= res;
          copyListFilter[indexListNotificationFilter]= res;
          notificationList = copyList;
          notificationListFilter = copyListFilter;
          notificationUnreadFilter();
          getNotificationUnread();
        }
      }
    } catch (error) {
      logger.i(error);
    }
  }

  Future<void> removeNotification(int id) async {
    try {
      bool res = await NotificationApi.removeNotificationApi(id);
      if (res) {
        notificationList = notificationList.where((element) => element.id != id).toList();
        notificationListFilter = notificationListFilter.where((element) => element.id != id).toList();
        notificationUnreadFilter();
        getNotificationUnread();
      }
    } catch (error) {
      logger.i(error);
    }
  }

}

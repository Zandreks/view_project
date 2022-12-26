import 'dart:async';

import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:provider/provider.dart';
import 'package:view_project/models/notification_data_model.dart';
import 'package:view_project/pages/home_page/providers/home_provider.dart';
import 'package:view_project/pages/home_page/widgets/list_project.dart';
import 'package:view_project/pages/home_page/widgets/menu_bar.dart';
import 'package:view_project/pages/notification_page/api/notification_api.dart';
import 'package:view_project/pages/notification_page/notification_page.dart';
import 'package:view_project/pages/notification_page/providers/notification_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer? timer;

  void createTimer() {
    try {
      timer = Timer.periodic(
        const Duration(seconds: 15),
        (timer) {
          NotificationProvider provider = context.read<NotificationProvider>();
          provider.getNotificationUnread();
        },
      );
    } catch (e) {
      debugPrint("$e");
    }
  }

  @override
  void initState() {
    createTimer();
    NotificationProvider provider = context.read<NotificationProvider>();
    provider.getNotificationUnread();
    context.read<HomeProvider>().getProjects();

    NotificationApi.getNotificationUnReadApi();
    super.initState();
  }

  @override
  void deactivate() {
    timer?.cancel();
    context.read<HomeProvider>().clearState();
    super.deactivate();
  }

  Future<void> _pullRefresh() async {
    context.read<HomeProvider>().clearState();
    context.read<HomeProvider>().getProjects();
  }

  @override
  Widget build(BuildContext context) {
    List<NotificationDataModel> notificationDataModel =
        context.select<NotificationProvider, List<NotificationDataModel>>(
            (state) => state.notificationUnread);
    HomeProvider provider = context.watch<HomeProvider>();
    return Scaffold(
      key: ValueKey('${context.locale}'),
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          title: SvgPicture.asset("assets/icons/logo.svg", fit: BoxFit.cover),
          actions: <Widget>[
            Badge(
              shape: BadgeShape.square,
              borderRadius: BorderRadius.circular(8),
              position: BadgePosition.topEnd(top: 0),
              padding: const EdgeInsets.all(2),
              badgeContent: Text(
                '${notificationDataModel.length}',
                style: const TextStyle(color: Colors.white),
              ),
              badgeColor: fromCssColor("#FF575F"),
              child: IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/notification.svg",
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const NotificationPage(),
                      fullscreenDialog: true,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            const MenuBar(),
            const SizedBox(
              width: 11,
            ),
          ]),
      body: SafeArea(
          child: RefreshIndicator(
        onRefresh: _pullRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: provider.controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 20, bottom: 5, right: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: !provider.isProjectDode
                              ? fromCssColor("#338DE0")
                              : Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          provider.setDoneProject(false);
                        },
                        child: Text(
                          tr("home_page_allProject"),
                          style: TextStyle(
                            color: !provider.isProjectDode
                                ? fromCssColor("#FFFFFF")
                                : fromCssColor("#96A0B5"),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: provider.isProjectDode
                                  ? fromCssColor("#338DE0")
                                  : Colors.transparent,                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            provider.setDoneProject(true);
                          },
                          child: Text(
                            tr("home_page_doneProject"),
                            style: TextStyle(
                              color: provider.isProjectDode
                                  ? fromCssColor("#FFFFFF")
                                  : fromCssColor("#96A0B5"),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              provider.loadingFirstPage == true
                  ? const Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(strokeWidth: 4),
                      ),
                    )
                  : const ListProject(),
              if (provider.loadingPage)
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(strokeWidth: 4),
                    ),
                  ),
                )
            ],
          ),
        ),
      )),
    );
  }
}

import 'dart:async';

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
      appBar: AppBar(
          centerTitle: false,
          title:  SvgPicture.asset(
            "assets/icons/logo.svg",
              fit: BoxFit.cover
          ),
          actions: <Widget>[
            Stack(children: [
              IconButton(
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
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: fromCssColor("#FF575F")),
                  alignment: Alignment.center,
                  child: Text('${notificationDataModel.length}'),
                ),
              )
            ]),
            const SizedBox(
              width: 45,
            ),
            const MenuBar(),
            const SizedBox(
              width: 31,
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
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: fromCssColor("#FFFFFF"),
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
                                ? fromCssColor("#202020")
                                : fromCssColor("#96A0B5"),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: fromCssColor("#FFFFFF"),
                            shape: RoundedRectangleBorder(
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
                                  ? fromCssColor("#202020")
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

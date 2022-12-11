import 'dart:async';

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:provider/provider.dart';
import 'package:view_project/models/notification_data_model.dart';
import 'package:view_project/pages/home_page/widgets/menu_bar.dart';
import 'package:view_project/pages/home_page/widgets/message_delete_user.dart';
import 'package:view_project/pages/login_page/providers/login_provider.dart';
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
    NotificationApi.getNotificationUnReadApi();
    super.initState();
  }
  @override
  void deactivate() {
    timer?.cancel();
    super.deactivate();
  }
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<NotificationDataModel> notificationDataModel = context.select<NotificationProvider, List<NotificationDataModel>>((state) =>state.notificationUnread);
    bool showModalDeleteUser = context.select<LoginProvider, bool>((state) =>state.showModalDeleteUser);
    if (showModalDeleteUser) {
      Future.delayed(Duration.zero, () => massageDeleteUser(context));
    }
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title: Image.asset("assets/images/logoBar.png", fit: BoxFit.cover),
          actions: <Widget>[
            Stack(children: [
              IconButton(
                icon: Image.asset("assets/icons/notification.png",
                    fit: BoxFit.cover),
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
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: fromCssColor("#FF575F")),
                  alignment: Alignment.center,
                  child: Text('${notificationDataModel.length}'),
                ),
              )
            ]),
            const SizedBox(width: 45,),
            const MenuBar(),
            const SizedBox(width: 31,),

          ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:provider/provider.dart';
import 'package:view_project/pages/notification_page/providers/notification_provider.dart';
import 'package:view_project/pages/notification_page/widgets/notification_list.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    context.read<NotificationProvider>().getNotification();
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
    context.read<NotificationProvider>().clearState();
  }

  Future<void> _pullRefresh() async {
    context.read<NotificationProvider>().clearState();
    context.read<NotificationProvider>().getNotification();
  }

  @override
  Widget build(BuildContext context) {
    bool isUnread = context.select<NotificationProvider, bool>(
        (state) => state.isNotificationUnread);
    bool loadingFirstPage = context
        .select<NotificationProvider, bool>((state) => state.loadingFirstPage);
    bool loadingPage = context
        .select<NotificationProvider, bool>((state) => state.loadingPage);
    NotificationProvider provider = context.read<NotificationProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(tr("notification_title")),
        centerTitle: false,
      ),
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
                  padding: const EdgeInsets.only(left: 20,top: 15,bottom: 15,right: 15),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: !isUnread
                          ? Colors.transparent
                          : fromCssColor("#338DE0"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      provider.setUnreadNotification();
                    },
                    child: Text(
                      tr("notification_button_text"),
                      style: TextStyle(
                        color: !isUnread
                            ? fromCssColor("#96A0B5")
                            :fromCssColor("#FFFFFF") ,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                loadingFirstPage == true
                    ? const Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(strokeWidth: 4),
                        ),
                      )
                    : const NotificationList(),
                if (loadingPage)
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
        ),
      ),
    );
  }
}

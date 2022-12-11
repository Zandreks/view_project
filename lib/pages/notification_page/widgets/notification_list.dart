import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:provider/provider.dart';
import 'package:view_project/_utils/parse_date.dart';
import 'package:view_project/pages/notification_page/providers/notification_provider.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  State<NotificationList> createState() => _NotificationListState();
}

void doNothing(BuildContext context) {}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    NotificationProvider provider = context.watch<NotificationProvider>();

    return ListView.builder(
        shrinkWrap: true,
        itemCount: provider.notificationListFilter.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, childIndex) {
          return Slidable(
            key: const ValueKey(1),
            startActionPane: ActionPane(
              dragDismissible: false,
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: [
                SlidableAction(
                  flex: 2,
                  backgroundColor: const Color(0xFF7BC043),
                  foregroundColor: Colors.white,
                  icon: Icons.check,
                  onPressed: (BuildContext context) {
                    provider.readNotification(
                        provider.notificationListFilter[childIndex].id!,
                        provider.notificationListFilter[childIndex].status!);
                  },
                ),
              ],
            ),
            endActionPane: ActionPane(
              dragDismissible: false,
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: [
                SlidableAction(
                  onPressed: (BuildContext context) {
                    provider.removeNotification(
                        provider.notificationListFilter[childIndex].id!);
                  },
                  backgroundColor: fromCssColor('#FF575F'),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  // label: '${tr(key)}/',
                ),
              ],
            ),
            child: Card(
              color:
                  provider.notificationListFilter[childIndex].status == "read"
                      ? Colors.white
                      : fromCssColor("#F2F6FF"),
              margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              child: InkWell(
                // onTap: (){},
                child: Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom:
                        BorderSide(color: fromCssColor("#C6D1DD"), width: 1),
                  )),
                  child: ListTile(
                    // leading: const Icon(Icons.account_circle_rounded),
                    title: Text(
                      "${provider.notificationListFilter[childIndex].name}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: fromCssColor("#121F3E")),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${provider.notificationListFilter[childIndex].description}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: fromCssColor("#121F3E")),
                        ),
                        Text(
                          getParseDate(
                              provider.notificationListFilter[childIndex]
                                  .createdAt!,
                              context.locale),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: fromCssColor("#121F3E")),
                        )
                      ],
                    ),
                    minLeadingWidth: 26,
                  ),
                ),
              ),
            ),
          );
        });
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

import '../../../../_utils/parse_date.dart';
import '../../../../models/project_item_model.dart';
import '../../providers/home_provider.dart';
import 'package:provider/provider.dart';

class InfoProject extends StatelessWidget {
  const InfoProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProjectItemModel projectItem = context
        .select<HomeProvider, ProjectItemModel>((state) => state.projectItem);
    return ExpansionTile(
      collapsedIconColor: fromCssColor("#338DE0"),
      iconColor: fromCssColor("#338DE0"),
      collapsedBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      title: Text(
        tr("home_page_infoProject"),
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: fromCssColor('#121F3E')),
      ),
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: Divider(
            height: 1,
            color: fromCssColor("#C6D1DD"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tr("home_page_createDate"),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: fromCssColor("#96A0B5")),
              ),
              Text(
                getParseDate(projectItem.createdAt!, context.locale),
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: fromCssColor('#080A1C')),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tr("home_page_startDate"),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: fromCssColor("#96A0B5")),
              ),
              Text(
                getParse(projectItem.start!, context.locale),
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: fromCssColor('#080A1C')),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tr("home_page_endDate"),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: fromCssColor("#96A0B5")),
              ),
              Text(
                getParse(projectItem.end!, context.locale),
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: fromCssColor('#080A1C')),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Divider(
            height: 1,
            color: fromCssColor("#C6D1DD"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                tr("home_page_status"),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: fromCssColor("#96A0B5")),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  tr("home_page_status_${projectItem.status}"),
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: fromCssColor('#080A1C')),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                tr("home_page_allTask"),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: fromCssColor("#96A0B5")),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "${projectItem.allTasksCount ?? ''}",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: fromCssColor('#080A1C')),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Divider(
            height: 1,
            color: fromCssColor("#C6D1DD"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                tr("home_page_myTask"),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: fromCssColor("#96A0B5")),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "${projectItem.myTasksCount ?? ''}",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: fromCssColor('#080A1C')),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                tr("home_page_dodeTask"),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: fromCssColor("#96A0B5")),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "${projectItem.doneTasksCount ?? ''}",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: fromCssColor('#080A1C')),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Divider(
            height: 1,
            color: fromCssColor("#C6D1DD"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                tr("home_page_countRick"),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: fromCssColor("#96A0B5")),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: fromCssColor('#080A1C')),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

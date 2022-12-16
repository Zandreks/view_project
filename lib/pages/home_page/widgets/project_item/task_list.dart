import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:provider/provider.dart';

import '../../../../models/project_item_model.dart';
import '../../providers/home_provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProjectItemModel projectItem = context
        .select<HomeProvider, ProjectItemModel>((state) => state.projectItem);
    return Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Text(
                tr("home_page_taskList"),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: fromCssColor("#080A1C")),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Divider(
                height: 1,
                color: fromCssColor("#C6D1DD"),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: projectItem.tasks?.length ?? 0,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, childIndex) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 15, bottom: 15),
                          child: Text(
                            "${projectItem.tasks?[childIndex].name ?? ''}",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: fromCssColor("#338DE0")),
                          )),
                      Divider(
                        height: 1.50,
                        color: fromCssColor("#DDDDDD80"),
                      ),
                    ],
                  );
                }),
          ],
        ));
  }
}

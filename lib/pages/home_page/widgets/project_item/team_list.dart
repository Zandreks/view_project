import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:provider/provider.dart';

import '../../../../models/project_item_model.dart';
import '../../providers/home_provider.dart';

class TeamList extends StatelessWidget {
  const TeamList({Key? key}) : super(key: key);

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
              tr("home_page_team"),
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: fromCssColor("#080A1C")),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Divider(
              height: 1,
              color: fromCssColor("#C6D1DD"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
                width: double.infinity,
                color: fromCssColor("#F2F7FF"),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                  child: Text(
                    tr("home_page_supervisor"),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: fromCssColor("#3C4E77")),
                  ),
                )),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: projectItem.managers?.length ?? 0,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, childIndex) {
                return Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${projectItem.managers?[childIndex].lastName ?? ''} ${projectItem.managers?[childIndex].firstName ?? ''}",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: fromCssColor("#080A1C")),
                      ),
                      Text(
                        "${projectItem.managers?[childIndex].organizationName ?? ''}",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: fromCssColor("#96A0B5")),
                      ),
                    ],
                  ),
                );
              }),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 12),
            child: Container(
                width: double.infinity,
                color: fromCssColor("#F2F7FF"),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                  child: Text(
                    tr("home_page_responsible"),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: fromCssColor("#3C4E77")),
                  ),
                )),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: projectItem.curators?.length ?? 0,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, childIndex) {
                return Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${projectItem.curators?[childIndex].lastName ?? ''} ${projectItem.curators?[childIndex].firstName ?? ''}",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: fromCssColor("#080A1C")),
                      ),
                      Text(
                        "${projectItem.curators?[childIndex].organizationName ?? ''}",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: fromCssColor("#96A0B5")),
                      ),
                    ],
                  ),
                );
              }),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 12 ),
            child: Container(
                width: double.infinity,
                color: fromCssColor("#F2F7FF"),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                  child: Text(
                    tr("home_page_members"),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: fromCssColor("#3C4E77")),
                  ),
                )),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: projectItem.members?.length ?? 0,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, childIndex) {
                return Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${projectItem.members?[childIndex].lastName ?? ''} ${projectItem.members?[childIndex].firstName ?? ''}",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: fromCssColor("#080A1C")),
                      ),
                      Text(
                        "${projectItem.members?[childIndex].organizationName ?? ''}",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: fromCssColor("#96A0B5")),
                      ),
                    ],
                  ),
                );
              }),
          const SizedBox(height: 12,)
        ],
      ),
    );
  }
}

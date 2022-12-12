import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:view_project/_utils/parse_date.dart';
import 'package:view_project/models/project_item_model.dart';
import 'package:view_project/pages/home_page/providers/home_provider.dart';

class ListProject extends StatefulWidget {
  const ListProject({Key? key}) : super(key: key);

  @override
  State<ListProject> createState() => _ListProjectState();
}

class _ListProjectState extends State<ListProject> {
  @override
  Widget build(BuildContext context) {
    HomeProvider provider = context.watch<HomeProvider>();
    return ListView.builder(
        shrinkWrap: true,
        itemCount: provider.projectFilter.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, childIndex) {
          ProjectItemModel item = provider.projectFilter[childIndex];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                      child: Expanded(
                        child: Text(
                          item.description ?? '',
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: fromCssColor("#121F3E")),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: LinearPercentIndicator(
                        animation: true,
                        padding: const EdgeInsets.all(0),
                        lineHeight: 5.0,
                        animationDuration: 2000,
                        percent: item.performPercent != null
                            ? item.performPercent! / 100
                            : 0,
                        progressColor: fromCssColor('#338DE0'),
                        backgroundColor: fromCssColor("#E7EDF2"),
                        barRadius: const Radius.circular(30),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            tr('home_page_doneCard'),
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: fromCssColor('#96A0B5')),
                          ),
                          Text(
                            "${item.performPercent}%",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: fromCssColor("#121F3E")),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: fromCssColor('#28C397'),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 10, right: 10),
                            child: Text(
                              "${tr("home_page_endCard")} ${getParseDateProject(item.end ?? '', context.locale)}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  children: [
                                    Image.asset("assets/icons/commentIcon.png"),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 3),
                                      child: Text(
                                        "${item.commentCount ?? ''}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: fromCssColor("#121F3E")),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  children: [
                                    Image.asset("assets/icons/tsskIcon.png"),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 3),
                                      child: Text(
                                        "${item.doneTasksCount ?? ''}/${item.allTasksCount ?? ''}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: fromCssColor("#121F3E")),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Image.asset("assets/icons/fileIcon.png"),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3),
                                    child: Text(
                                      "${item.files?.length ?? ''}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: fromCssColor("#121F3E")),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

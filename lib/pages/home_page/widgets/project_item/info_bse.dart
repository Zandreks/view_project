import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:provider/provider.dart';

import '../../../../models/project_item_model.dart';
import '../../providers/home_provider.dart';

class InfoBase extends StatefulWidget {
  const InfoBase({Key? key}) : super(key: key);

  @override
  State<InfoBase> createState() => _InfoBaseState();
}

class _InfoBaseState extends State<InfoBase> {
  bool fullOpen = false;

  @override
  Widget build(BuildContext context) {
    ProjectItemModel projectItem = context
        .select<HomeProvider, ProjectItemModel>((state) => state.projectItem);
    return Container(
      padding: const EdgeInsets.all(15.0),
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            projectItem.name ?? "",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: fromCssColor("#338DE0")),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Text(
                  tr('home_page_typeProject'),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: fromCssColor("#8B96A5")),
                ),
                Text(
                  tr("home_page_typeProject_${projectItem.projectType}"),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: fromCssColor("#121F3E")),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 10),
            child: Text(
              tr("home_page_description"),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: fromCssColor('#96A0B5')),
            ),
          ),
          !fullOpen
              ? Text(projectItem.description ?? '',
                  maxLines: 4,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: fromCssColor('#121F3E'),
                  ))
              : Text(projectItem.description ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: fromCssColor('#121F3E'),
                  )),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        fullOpen = !fullOpen;
                      });
                    },
                    child: Row(
                      children: [
                        Text(tr(!fullOpen ? "home_page_full" : 'home_page_smail',),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: fromCssColor("#338DE0")
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SvgPicture.asset(
                            !fullOpen?"assets/icons/full.svg":"assets/icons/smail.svg",
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

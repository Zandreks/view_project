import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

import '../../../../config/environment.dart';
import '../../../../models/project_item_model.dart';
import '../../providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FileList extends StatelessWidget {
  const FileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String baseUrl = Environment().config.storage;

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
                tr("home_page_fileList"),
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
            ListView.builder(
                shrinkWrap: true,
                itemCount: projectItem.files?.length ?? 0,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, childIndex) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 15),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.centerLeft),
                      onPressed: () async {
                        final Uri _url = Uri.parse(
                            '$baseUrl${projectItem.files?[childIndex].src ?? ""}');
                        if (!await launchUrl(_url,mode: LaunchMode.externalNonBrowserApplication)) {}
                      },
                      child: Text(
                        projectItem.files?[childIndex].name ?? '',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: fromCssColor('#338DE0')),
                      ),
                    ),
                  );
                }),
          ],
        ));
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import '../../../../config/environment.dart';
import '../../../../models/project_item_model.dart';
import '../../providers/home_provider.dart';

class GetOrder extends StatelessWidget {
  const GetOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String baseUrl = Environment().config.apiHost;
    ProjectItemModel projectItem = context
        .select<HomeProvider, ProjectItemModel>((state) => state.projectItem);

    return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: OutlinedButton(
                onPressed: () async {
                  final Uri _url = Uri.parse(
                      '${baseUrl}v1/project/${projectItem.id}/report');
                  if (!await launchUrl(_url)) {}
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: fromCssColor("#28C3971A"),
                  shadowColor: Colors.transparent,
                  side: BorderSide(width: 1.0, color: fromCssColor("#28C397")),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      tr("home_page_getPdf"),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: fromCssColor("#28C397")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Icon(
                        Icons.download_outlined,
                        color: fromCssColor("#28C397"),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}

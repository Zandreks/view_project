import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:provider/provider.dart';

import '../../../../models/project_item_model.dart';
import '../../providers/home_provider.dart';

class ListStatusInvestment extends StatefulWidget {
  const ListStatusInvestment({Key? key}) : super(key: key);

  @override
  State<ListStatusInvestment> createState() => _ListStatusInvestmentState();
}

class _ListStatusInvestmentState extends State<ListStatusInvestment> {
  @override
  Widget build(BuildContext context) {
    ProjectItemModel projectItem = context
        .select<HomeProvider, ProjectItemModel>((state) => state.projectItem);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: ExpansionTile(
            collapsedIconColor: fromCssColor("#338DE0"),
            iconColor: fromCssColor("#338DE0"),
            collapsedBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            title: Text(
              tr("home_page_status_zu"),
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: fromCssColor('#121F3E')),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_active"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    Text(
                      tr(projectItem.zu != null && projectItem.zu != "0"
                          ? "home_page_status_active_yes"
                          : "home_page_status_active_no"),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_status"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    const Text(
                      "",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_number"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    Text(
                      projectItem.zu_number ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_comment"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    Text(
                      projectItem.zu_comment ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: ExpansionTile(
            collapsedIconColor: fromCssColor("#338DE0"),
            iconColor: fromCssColor("#338DE0"),
            collapsedBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            title: Text(
              tr("home_page_status_psd"),
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: fromCssColor('#121F3E')),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_active"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    Text(
                      tr(projectItem.psd != null && projectItem.psd != "0"
                          ? "home_page_status_active_yes"
                          : "home_page_status_active_no"),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_status"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    const Text(
                      "",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_number"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    Text(
                      projectItem.psd_number ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_comment"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    Text(
                      projectItem.psd_comment ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: ExpansionTile(
            collapsedIconColor: fromCssColor("#338DE0"),
            iconColor: fromCssColor("#338DE0"),
            collapsedBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            title: Text(
              tr("home_page_status_gip"),
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: fromCssColor('#121F3E')),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_active"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    Text(
                      tr(projectItem.gip != null && projectItem.gip != "0"
                          ? "home_page_status_active_yes"
                          : "home_page_status_active_no"),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_status"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    const Text(
                      "",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_number"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    Text(
                      projectItem.gip_number ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_comment"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    Text(
                      projectItem.gip_comment ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: ExpansionTile(
            collapsedIconColor: fromCssColor("#338DE0"),
            iconColor: fromCssColor("#338DE0"),
            collapsedBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            title: Text(
              tr("home_page_status_feo"),
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: fromCssColor('#121F3E')),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_active"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    Text(
                      tr(projectItem.feo != null && projectItem.feo != "0"
                          ? "home_page_status_active_yes"
                          : "home_page_status_active_no"),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_status"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    const Text(
                      "",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_number"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    Text(
                      projectItem.feo_number ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_comment"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    Text(
                      projectItem.feo_comment ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: ExpansionTile(
            collapsedIconColor: fromCssColor("#338DE0"),
            iconColor: fromCssColor("#338DE0"),
            collapsedBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            title: Text(
              tr("home_page_status_budget"),
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: fromCssColor('#121F3E')),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_active"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    Text(
                      tr(projectItem.business_plan != null &&
                              projectItem.business_plan != "0"
                          ? "home_page_status_active_yes"
                          : "home_page_status_active_no"),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_status"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    const Text(
                      "",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_comment"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    Text(
                      projectItem.business_plan_comment ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: ExpansionTile(
            collapsedIconColor: fromCssColor("#338DE0"),
            iconColor: fromCssColor("#338DE0"),
            collapsedBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            title: Text(
              tr("home_page_status_fin_econom"),
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: fromCssColor('#121F3E')),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_active"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    Text(
                      tr(projectItem.fin_econom != null &&
                              projectItem.fin_econom != "0"
                          ? "home_page_status_active_yes"
                          : "home_page_status_active_no"),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_status"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    Text(
                      "",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_comment"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    Text(
                      projectItem.fin_econom_comment ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: ExpansionTile(
            collapsedIconColor: fromCssColor("#338DE0"),
            iconColor: fromCssColor("#338DE0"),
            collapsedBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            title: Text(
              tr("home_page_status_marketing_plan"),
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: fromCssColor('#121F3E')),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_active"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    Text(
                      tr(projectItem.marketing_plan != null &&
                              projectItem.marketing_plan != "0"
                          ? "home_page_status_active_yes"
                          : "home_page_status_active_no"),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_status"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    const Text(
                      "",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_comment"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    Text(
                      projectItem.marketing_plan_comment ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: ExpansionTile(
            collapsedIconColor: fromCssColor("#338DE0"),
            iconColor: fromCssColor("#338DE0"),
            collapsedBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            title: Text(
              tr("home_page_status_currentStatus"),
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: fromCssColor('#121F3E')),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_active"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    Text(
                      tr("home_page_status_active_no"),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_status"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    const Text(
                      "",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("home_page_status_comment"),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: fromCssColor('#96a0b5')),
                    ),
                    Text(
                      '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

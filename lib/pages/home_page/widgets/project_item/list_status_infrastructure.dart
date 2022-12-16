import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:provider/provider.dart';

import '../../../../models/project_item_model.dart';
import '../../providers/home_provider.dart';

class ListStatusInfrastructure extends StatelessWidget {
  const ListStatusInfrastructure({Key? key}) : super(key: key);

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
              tr("home_page_status_gprt"),
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
                      tr(projectItem.gprt != null && projectItem.gprt !="0"
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
                      projectItem.gprt_number ?? '',
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
                      projectItem.gprt_comment ?? '',
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
              tr("home_page_status_dkz"),
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
                      tr(projectItem.dkz != null &&  projectItem.dkz !="0"
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
                      projectItem.dkz_number ?? '',
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
                      projectItem.dkz_comment ?? '',
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
              tr("home_page_status_teo"),
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
                      tr(projectItem.teo != null &&  projectItem.teo !="0"
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
                      projectItem.teo_number ?? '',
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
                      projectItem.teo_comment ?? '',
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
                      tr(projectItem.psd != null &&  projectItem.psd !="0"
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
                      tr(projectItem.budget != null &&  projectItem.budget !="0"
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
                      projectItem.budget_comment ?? '',
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
              tr("home_page_status_status_bz"),
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
                      tr(projectItem.budget_status != null
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
                      tr("home_page_status_bz_${projectItem.budget_status}"),
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
                      projectItem.budget_status_comment ?? '',
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
              tr("home_page_status_competitive"),
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
                      tr(projectItem.competitive != null &&  projectItem.competitive !="0"
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
                      projectItem.competitive_comment ?? '',
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
              tr("home_page_status_smr"),
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
                      tr(projectItem.smr != null &&  projectItem.smr !="0"
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
                      projectItem.smr_comment ?? '',
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

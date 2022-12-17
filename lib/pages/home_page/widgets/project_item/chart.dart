import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:view_project/_utils/number_mask.dart';

import '../../../../models/project_item_model.dart';
import '../../providers/home_provider.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  double finalAmount = 0;

  double getFullAmount(ProjectItemModel projectItem) {
    double fullAmount = 0.0;
    if (projectItem.fin_sum != null) {
      fullAmount = double.parse("${projectItem.fin_sum ?? "0"}");
    }
    if (projectItem.fin_source_sum_budget != null) {
      fullAmount =
          fullAmount - double.parse(projectItem.fin_source_sum_budget ?? "0");
    }
    if (projectItem.fin_source_sum_local_budget != null) {
      fullAmount = fullAmount -
          double.parse(projectItem.fin_source_sum_local_budget ?? "0");
    }
    if (projectItem.fin_source_sum_republican_budget != null) {
      fullAmount = fullAmount -
          double.parse(projectItem.fin_source_sum_republican_budget ?? "0");
    }
    if (projectItem.fin_source_sum_investments != null) {
      fullAmount = fullAmount -
          double.parse(projectItem.fin_source_sum_investments ?? "0");
    }
    if (projectItem.fin_source_sum_other != null) {
      fullAmount =
          fullAmount - double.parse(projectItem.fin_source_sum_other ?? "0");
    }
    return fullAmount;
  }

  void getFinalAmount(ProjectItemModel projectItem) {
    double fullAmount = 0.0;
    if (projectItem.fin_source_sum_budget != null) {
      fullAmount =
          fullAmount + double.parse(projectItem.fin_source_sum_budget ?? "0");
    }
    if (projectItem.fin_source_sum_local_budget != null) {
      fullAmount = fullAmount +
          double.parse(projectItem.fin_source_sum_local_budget ?? "0");
    }
    if (projectItem.fin_source_sum_republican_budget != null) {
      fullAmount = fullAmount +
          double.parse(projectItem.fin_source_sum_republican_budget ?? "0");
    }
    if (projectItem.fin_source_sum_investments != null) {
      fullAmount = fullAmount +
          double.parse(projectItem.fin_source_sum_investments ?? "0");
    }
    if (projectItem.fin_source_sum_other != null) {
      fullAmount =
          fullAmount + double.parse(projectItem.fin_source_sum_other ?? "0");
    }
    setState(() {
      finalAmount = fullAmount;
    });
  }

  List<PieChartSectionData>? showingSections(ProjectItemModel projectItem) {
    List<PieChartSectionData>? data = [];
    final radius = 20.0;

    if (projectItem.fin_source_sum_budget != null) {
      data.add(PieChartSectionData(
          color: fromCssColor('#338DE0'),
          value: double.parse(
              ((double.parse(projectItem.fin_source_sum_budget ?? "0") * 100) /
                      finalAmount)
                  .toStringAsFixed(1)),
          radius: radius,
          showTitle: false));
    }
    if (projectItem.fin_source_sum_local_budget != null) {
      data.add(PieChartSectionData(
          color: fromCssColor('#338DE080'),
          value: double.parse(
              ((double.parse(projectItem.fin_source_sum_local_budget ?? "0") *
                          100) /
                      finalAmount)
                  .toStringAsFixed(1)),
          radius: radius,
          showTitle: false));
    }
    if (projectItem.fin_source_sum_republican_budget != null) {
      data.add(PieChartSectionData(
          color: fromCssColor('#338DE04D'),
          value: double.parse(((double.parse(
                          projectItem.fin_source_sum_republican_budget ?? "0") *
                      100) /
                  finalAmount)
              .toStringAsFixed(1)),
          radius: radius,
          showTitle: false));
    }
    if (projectItem.fin_source_sum_investments != null) {
      data.add(PieChartSectionData(
          color: fromCssColor('#34CC31'),
          value: double.parse(
              ((double.parse(projectItem.fin_source_sum_investments ?? "0") *
                          100) /
                      finalAmount)
                  .toStringAsFixed(1)),
          radius: radius,
          showTitle: false));
    }
    if (projectItem.fin_source_sum_other != null) {
      data.add(PieChartSectionData(
          color: fromCssColor('#D55DB0'),
          value: double.parse(
              ((double.parse(projectItem.fin_source_sum_other ?? "0") * 100) /
                      finalAmount)
                  .toStringAsFixed(1)),
          radius: radius,
          showTitle: false));
    }
    if (data.length > 0) return data;
    return null;
  }

  @override
  void initState() {
    ProjectItemModel projectItem = context.read<HomeProvider>().projectItem;
    getFinalAmount(projectItem);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProjectItemModel projectItem = context
        .select<HomeProvider, ProjectItemModel>((state) => state.projectItem);
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  tr("home_page_summa"),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: fromCssColor("#96A0B5")),
                ),
                Text(
                  "${numberMaskPrice(projectItem.fin_sum ?? 0)} ${tr("home_page_tengw")}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: fromCssColor("#000000")),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                tr("home_page_finSours"),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: fromCssColor("#96A0B5")),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    projectItem.fin_source_sum_budget != null
                        ? Row(
                            children: [
                              Container(
                                width: 17,
                                height: 4,
                                color: fromCssColor('#338DE0'),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 18, left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 140,
                                      child: Text(
                                        tr('home_page_budget'),
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: fromCssColor("#A0A0A0")),
                                      ),
                                    ),
                                    Text(
                                      "${double.parse(((double.parse(projectItem.fin_source_sum_budget ?? "0") * 100) / finalAmount).toStringAsFixed(1))}%",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: fromCssColor("#080A1C")),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        : SizedBox(),
                    projectItem.fin_source_sum_local_budget != null
                        ? Row(
                            children: [
                              Container(
                                width: 17,
                                height: 4,
                                color: fromCssColor('#338DE080'),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 18, left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 140,
                                      child: Text(
                                        tr('home_page_budgetLocal'),
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: fromCssColor("#A0A0A0")),
                                      ),
                                    ),
                                    Text(
                                      "${double.parse(((double.parse(projectItem.fin_source_sum_local_budget ?? "0") * 100) / finalAmount).toStringAsFixed(1))}%",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: fromCssColor("#080A1C")),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        : SizedBox(),
                    projectItem.fin_source_sum_republican_budget != null
                        ? Row(
                            children: [
                              Container(
                                width: 17,
                                height: 4,
                                color: fromCssColor('#338DE04D'),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 18, left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 140,
                                      child: Text(
                                        tr('home_page_budgetGos'),
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: fromCssColor("#A0A0A0")),
                                      ),
                                    ),
                                    Text(
                                      "${double.parse(((double.parse(projectItem.fin_source_sum_republican_budget ?? "0") * 100) / finalAmount).toStringAsFixed(1))}%",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: fromCssColor("#080A1C")),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        : SizedBox(),
                    projectItem.fin_source_sum_investments != null
                        ? Row(
                            children: [
                              Container(
                                width: 17,
                                height: 4,
                                color: fromCssColor('#34CC31'),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 18, left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 140,
                                      child: Text(
                                        tr('home_page_budgetInvestments'),
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: fromCssColor("#A0A0A0")),
                                      ),
                                    ),
                                    Text(
                                      "${double.parse(((double.parse(projectItem.fin_source_sum_investments ?? "0") * 100) / finalAmount).toStringAsFixed(1))}%",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: fromCssColor("#080A1C")),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        : SizedBox(),
                    projectItem.fin_source_sum_other != null
                        ? Row(
                            children: [
                              Container(
                                width: 17,
                                height: 4,
                                color: fromCssColor('#D55DB0'),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 18, left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 140,
                                      child: Text(
                                        tr('home_page_budgetOther'),
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: fromCssColor("#A0A0A0")),
                                      ),
                                    ),
                                    Text(
                                      "${double.parse(((double.parse(projectItem.fin_source_sum_other ?? "0") * 100) / finalAmount).toStringAsFixed(1))}%",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: fromCssColor("#080A1C")),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        : SizedBox(),
                  ],
                )),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 5,
                        centerSpaceRadius: 40,
                        sections: showingSections(projectItem),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text(
                tr("home_page_prosDone"),
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: fromCssColor("#96A0B5")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: LinearPercentIndicator(
                animation: true,
                padding: const EdgeInsets.all(0),
                lineHeight: 5.0,
                animationDuration: 2000,
                percent: projectItem.performPercent != null
                    ? projectItem.performPercent! / 100
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
                    "${projectItem.performPercent ?? ""}%",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: fromCssColor("#121F3E")),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                children: [
                  Text(
                    tr("home_page_fullAmount"),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: fromCssColor("#96A0B5")),
                  ),
                  Text(
                    "${numberMaskPrice(getFullAmount(projectItem))} ${tr('home_page_tengw')}",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: fromCssColor("#000000")),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

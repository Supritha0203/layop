import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:layop2/util/app_constant.dart';
import 'package:layop2/widget/k_height.dart';
import 'package:layop2/widget/k_text.dart';
import 'package:layop2/widget/k_width.dart';
import 'package:layop2/widget/pie_chart_assesment.dart';
import 'package:layop2/widget/pie_indicator.dart';

class HistoryDailyDetails extends StatefulWidget {
  final String? date;
  const HistoryDailyDetails({super.key, this.date});

  @override
  State<HistoryDailyDetails> createState() => _HistoryDailyDetailsState();
}

class _HistoryDailyDetailsState extends State<HistoryDailyDetails> {
  @override
  Widget build(BuildContext context) {
    // Assessment a = Assessment("1", "Maths", true, "montessori", "12/12/12",
    //     "edoo@gmail.com", ["helped to write"], ["Had to remind to focus"]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const KText(text: "Daily Assessment Details"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstant.horizontalPagePadding,
              vertical: AppConstant.verticalPagePadding),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const KText(
                color: AppConstant.titleTextColor,
                weight: FontWeight.bold,
                text: "Daily History",
                size: AppConstant.titleText,
              ),
              const KHeight(height: AppConstant.largeSpace),
              KText(
                text: "Date: ${widget.date}",
                size: AppConstant.titleText,
              ),
              Divider(),
              const KHeight(height: AppConstant.largeSpace),
              const KText(
                color: AppConstant.titleTextColor,
                weight: FontWeight.bold,
                text: "Assessment",
                size: AppConstant.titleText,
              ),
              const KHeight(height: AppConstant.largeSpace),
              Row(
                children: [
                  const KText(
                    text: "Topic : ",
                    size: AppConstant.titleText,
                    color: AppConstant.tinyTextColor,
                    weight: FontWeight.bold,
                  ),
                  const k_width(
                    width: 20,
                  ),
                  KText(
                    text: 'a.topicName',
                    size: AppConstant.titleText,
                  ),
                ],
              ),
              const KHeight(height: AppConstant.largeSpace),
              Row(
                children: [
                  const KText(
                    color: AppConstant.tinyTextColor,
                    weight: FontWeight.bold,
                    text: "Methodology : ",
                    size: AppConstant.titleText,
                  ),
                  const k_width(
                    width: 20,
                  ),
                  KText(
                    text: 'a.methodology',
                    size: AppConstant.titleText,
                  ),
                ],
              ),
              const KHeight(height: AppConstant.largeSpace),
              Row(
                children: [
                  const KText(
                    text: "Assigned Date : ",
                    color: AppConstant.tinyTextColor,
                    weight: FontWeight.bold,
                    size: AppConstant.titleText,
                  ),
                  const k_width(
                    width: 20,
                  ),
                  KText(
                    text: ' a.assignedDate',
                    size: AppConstant.titleText,
                  ),
                ],
              ),
              const KHeight(height: AppConstant.largeSpace),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const KText(
                    text: "Physical Prompts : ",
                    color: AppConstant.tinyTextColor,
                    weight: FontWeight.bold,
                    size: AppConstant.titleText,
                  ),
                  const k_width(
                    width: 20,
                  ),
                  Flexible(
                    child: KText(
                      text: 'a.physicalPrompts.toString()',
                      size: AppConstant.titleText,
                    ),
                  ),
                ],
              ),
              const KHeight(height: AppConstant.largeSpace),
              Row(
                children: [
                  const KText(
                    text: "Verbal Prompts : ",
                    color: AppConstant.tinyTextColor,
                    weight: FontWeight.bold,
                    size: AppConstant.titleText,
                  ),
                  const k_width(
                    width: 20,
                  ),
                  KText(
                    text: 'a.verbalPrompts.toString()',
                    size: AppConstant.titleText,
                  ),
                ],
              ),
              KHeight(height: AppConstant.largeSpace),
              // Padding(
              //   padding: const EdgeInsets.symmetric(
              //       vertical: AppConstant.verticalPagePadding),
              //   child: Column(
              //     children: getQuestions(),
              //   ),
              // ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .4,
                        height: 200,
                        child: PieChart(PieChartData(
                            centerSpaceRadius: 40, sections: getSection())),
                      ),
                      const PieIndicator()
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

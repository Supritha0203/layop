import 'package:flutter/material.dart';
import 'package:layop2/util/app_constant.dart';
import 'package:layop2/widget/k_height.dart';
import 'package:layop2/widget/k_text.dart';
import 'package:layop2/widget/k_width.dart';

class HistoryExamDetails extends StatefulWidget {
  final String? date;
  const HistoryExamDetails({super.key, this.date});

  @override
  State<HistoryExamDetails> createState() => _HistoryExamDetailsState();
}

class _HistoryExamDetailsState extends State<HistoryExamDetails> {
  @override
  Widget build(BuildContext context) {
    // Assessment a = Assessment("1", "Maths", true, "montessori", "12/12/12",
    //     "edoo@gmail.com", ["helped to write"], ["Had to remind to focus"]);

    // ExamTemplate exams =
    //     new ExamTemplate(["Maths", "English"], "Very good", "25/30");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const KText(text: "Exam History Details"),
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
                text: "Exam History",
                size: AppConstant.titleText,
              ),
              const KHeight(height: AppConstant.largeSpace),
              KText(
                text: "Date: ${widget.date}",
                size: AppConstant.titleText,
              ),
              const KHeight(height: AppConstant.largeSpace),
              Row(
                children: [
                  const KText(
                    text: "Units : ",
                    size: AppConstant.titleText,
                  ),
                  const k_width(
                    width: 20,
                  ),
                  KText(
                    text: 'exams.units.toString()',
                    size: AppConstant.titleText,
                  ),
                ],
              ),
              const KHeight(height: AppConstant.largeSpace),
              Row(
                children: [
                  const KText(
                    text: "Performance : ",
                    size: AppConstant.titleText,
                  ),
                  const k_width(
                    width: 20,
                  ),
                  KText(
                    text: 'exams.performance.toString()',
                    size: AppConstant.titleText,
                  ),
                ],
              ),
              const KHeight(height: AppConstant.largeSpace),
              Row(
                children: [
                  const KText(
                    text: "Atendance : ",
                    size: AppConstant.titleText,
                  ),
                  const k_width(
                    width: 20,
                  ),
                  KText(
                    text: 'exams.attendace',
                    size: AppConstant.titleText,
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(
              //       vertical: AppConstant.verticalPagePadding),
              //   child: Column(
              //     children: getQuestions(),
              //   ),
              // ),
            ]),
          ),
        ),
      ),
    );
  }
}

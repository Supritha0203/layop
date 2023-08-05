import 'package:flutter/material.dart';
import 'package:layop2/pages/history/history_exam_page.dart';
import 'package:layop2/util/app_constant.dart';
import 'package:layop2/widget/k_height.dart';
import 'package:layop2/widget/k_text.dart';
import '../../../widget/k_button.dart';
import 'history_daily_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const KText(text: "History"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstant.horizontalPagePadding,
            vertical: AppConstant.verticalPagePadding),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            const KHeight(height: AppConstant.largeSpace),
            KButtonPrimary(
              text: "History of daily activities",
              function: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HistoryDailyPage(),
                    ));
              },
            ),
            const KHeight(height: AppConstant.largeSpace),
            KButtonPrimary(
              text: "History of test",
              function: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HistoryExamPage(),
                    ));
              },
            )
          ]),
        ),
      )),
    );
  }
}

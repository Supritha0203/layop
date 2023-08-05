import 'package:flutter/material.dart';
import 'package:layop2/util/app_constant.dart';
import 'package:layop2/widget/k_height.dart';
import 'package:layop2/widget/k_text.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.deepOrange,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(AppConstant
                                                  .borderRadiusWidget))),
                                      width: 40,
                                      height: 40,
                                      child: const Icon(
                                        Icons.calendar_month,
                                        color: AppConstant.whiteTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    KText(
                                      text: "Unit Test ${index + 2}",
                                      size: AppConstant.titleText,
                                      weight: FontWeight.normal,
                                      color: AppConstant.tinyTextColor,
                                    ),
                                    const KText(
                                      text: "Unit name",
                                      size: AppConstant.leadingText,
                                      weight: FontWeight.bold,
                                      color: AppConstant.primaryColor,
                                    ),
                                    const KHeight(
                                        height: AppConstant.largeSpace),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: const [
                                        KText(
                                            text: "scheduled for : ",
                                            size: AppConstant.titleText),
                                        KText(
                                          text: "Mon 14 dec 2022",
                                          color: AppConstant.successCOlor,
                                          weight: FontWeight.bold,
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
              itemCount: 1),
        )
      ],
    );
  }
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:layop2/widget/pie_chart_assesment.dart';
import 'package:layop2/widget/pie_indicator.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Progress"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: PieChart(
              PieChartData(
                sectionsSpace: 0,
                centerSpaceRadius: 40,
                sections: getSection(),
              ),
            ),
          ),
          PieIndicator()
        ],
      ),
    );
  }
}

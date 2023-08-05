import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:layop2/util/app_constant.dart';

import '../data/assesment_data.dart';

List<PieChartSectionData> getSection() => PieAssData.assData
    .asMap()
    .map<int, PieChartSectionData>((index, data) {
      final value = PieChartSectionData(
          color: data.color,
          value: data.precent,
          title: '${data.precent}%',
          titleStyle: const TextStyle(
              fontSize: AppConstant.functionText,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff)));
      return MapEntry(index, value);
    })
    .values
    .toList();

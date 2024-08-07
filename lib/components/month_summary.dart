import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:habbit_tracker/datetime/date_time.dart';

class MonthlySummary extends StatelessWidget {
  final Map<DateTime, int>? datasets;

  final String startDate;

  const MonthlySummary(
      {super.key, required this.datasets, required this.startDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: HeatMap(
          startDate: createDataTimeObject(startDate),
          endDate: DateTime.now().add(Duration(days: 0)),
          datasets: datasets,
          colorMode: ColorMode.color,
          defaultColor: Colors.grey[200],
          textColor: Colors.white,
          showColorTip: false,
          showText: true,
          scrollable: true,
          size: 30,
          colorsets: const {
            1: Colors.red,
            3: Colors.orange,
            5: Colors.yellow,
            7: Colors.green,
            9: Colors.blue,
            11: Colors.indigo,
            13: Colors.purple,
          }),
    );
  }
}

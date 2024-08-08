import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:habbit_tracker/datetime/date_time.dart';

class MonthlySummary extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDate;

  const MonthlySummary({
    super.key,
    required this.datasets,
    required this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    // Determine if the theme is dark or light
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Define color sets for dark and light modes
    Map<int, Color> colorsets = isDarkMode
        ? {
            1: Color.fromARGB(20, 255, 193, 7),
            2: Color.fromARGB(40, 255, 193, 7),
            3: Color.fromARGB(60, 255, 193, 7),
            4: Color.fromARGB(80, 255, 193, 7),
            5: Color.fromARGB(100, 255, 193, 7),
            6: Color.fromARGB(120, 255, 193, 7),
            7: Color.fromARGB(140, 255, 193, 7),
            8: Color.fromARGB(160, 255, 193, 7),
            9: Color.fromARGB(180, 255, 193, 7),
            10: Color.fromARGB(200, 255, 193, 7),
          }
        : {
            1: Color.fromARGB(20, 2, 179, 8),
            2: Color.fromARGB(40, 2, 179, 8),
            3: Color.fromARGB(60, 2, 179, 8),
            4: Color.fromARGB(80, 2, 179, 8),
            5: Color.fromARGB(100, 2, 179, 8),
            6: Color.fromARGB(120, 2, 179, 8),
            7: Color.fromARGB(140, 2, 179, 8),
            8: Color.fromARGB(160, 2, 179, 8),
            9: Color.fromARGB(180, 2, 179, 8),
            10: Color.fromARGB(200, 2, 179, 8),
          };

    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: HeatMap(
        startDate: createDataTimeObject(startDate),
        endDate: DateTime.now(),
        datasets: datasets,
        colorMode: ColorMode.color,
        defaultColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
        textColor: isDarkMode ? Colors.white : Colors.black,
        showColorTip: false,
        showText: true,
        scrollable: true,
        size: 30,
        colorsets: colorsets,
        onClick: (value) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value.toString()),
          ));
        },
      ),
    );
  }
}

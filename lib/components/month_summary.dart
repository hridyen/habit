import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:habit/datetime/date_time.dart';

class MonthlySummary extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDate;

  const MonthlySummary({
    super.key,
    required this.datasets,
    required this.startDate
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: SizedBox(
        width: 360, // Set the desired width
        height: 360, // Set the desired height
        child: HeatMap(
          startDate: createDateTimeObject(startDate),
          endDate: DateTime.now().add(Duration(days: 0)),
          datasets: datasets,
          colorMode: ColorMode.color,
          defaultColor: Colors.grey[200],
          textColor: Colors.white,
          showColorTip: false,
          showText: true,
          scrollable: true,
          size: 40, // Increase the size of each cell
          colorsets: const {
            1: Color.fromARGB(20, 2, 179, 8),
            2: Color.fromARGB(40, 2, 179, 8),
            3: Color.fromARGB(60, 2, 179, 8),
            4: Color.fromARGB(80, 2, 179, 8),
            5: Color.fromARGB(100, 2, 179, 8),
            6: Color.fromARGB(120, 2, 179, 8),
            7: Color.fromARGB(150, 2, 179, 8),
            8: Color.fromARGB(180, 2, 179, 8),
            9: Color.fromARGB(220, 2, 179, 8),
            10: Color.fromARGB(255, 2, 179, 8),
          },
          onClick: (value) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(value.toString())));
          },
        ),
      ),
    );
  }
}

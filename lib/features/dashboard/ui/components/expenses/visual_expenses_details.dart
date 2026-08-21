import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class VisualExpensesDetails extends StatelessWidget {
  final curves = [
    {"value": 35, "color": Colors.green, "title": "Food"},
    {"value": 4, "color": Colors.blueAccent, "title": "Rent"},
    {"value": 28, "color": Colors.red, "title": "Shopping"},
    {"value": 6, "color": Colors.purple, "title": "Fax"},
    {"value": 20, "color": Colors.yellow, "title": "Laundary"},
    {"value": 7, "color": Colors.teal, "title": "Entertainment"},
  ];

  VisualExpensesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      width: 320,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(167, 230, 229, 229),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 290,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: PieChart(
                      PieChartData(
                        startDegreeOffset: 180,
                        sectionsSpace: 1,
                        centerSpaceRadius: 90,
                        borderData: FlBorderData(show: false),
                        sections: [
                          ...curves.map(
                            (curve) => PieChartSectionData(
                              value: double.parse(curve["value"].toString()),
                              color: curve["color"] as Color,
                              title: "${curve["value"]}%",
                              radius: 25,
                              titlePositionPercentageOffset: 1.7,
                            ),
                          ),
                          // Hidden bottom half
                          PieChartSectionData(
                            value: 100,
                            color: Colors.transparent,
                            radius: 18,
                            title: "",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Center dot
                Positioned(
                  top: 120,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 204, 203, 203),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                  ),
                ),

                // colored labeled items
                Positioned(
                  top: 180,
                  child: SizedBox(
                    width: 300,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 20,
                      runSpacing: 12,
                      children: curves
                          .map(
                            (curve) => _LegendItem(
                              title: curve["title"] as String,
                              color: curve["color"] as Color,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String title;

  const _LegendItem({required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(radius: 7, backgroundColor: color),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

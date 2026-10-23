import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/data/enums/transaction_type.dart';
import 'package:mahfazty/features/transactions/logic/transactions_cubit/transactions_cubit.dart';

class VisualExpensesDetails extends StatelessWidget {
  const VisualExpensesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsCubit, TransactionsState>(
      builder: (_, state) {
        final dstats = state.dayStatistics;
        return Visibility(
          visible: state.dStatus != TransactionStatus.successWithoutData,
          child: Container(
            height: 310,
            width: 320,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                                ...dstats.statistics.map((stat) {
                                  double value =
                                      (stat["amount"] / dstats.total) * 100;
                                  value = value.toInt() == 0 ? 1.0 : value;
                                  return PieChartSectionData(
                                    value: value,
                                    color: Color(stat["color"] as int),
                                    title: "${value.toInt()}%",
                                    radius: 25,
                                    titlePositionPercentageOffset: 1.7,
                                  );
                                }),
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
                            children: dstats.statistics
                                .map(
                                  (stat) => Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircleAvatar(
                                        radius: 7,
                                        backgroundColor: Color(
                                          stat["color"] as int,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        stat["name"] as String,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
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
          ),
        );
      },
    );
  }
}

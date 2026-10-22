import 'package:equatable/equatable.dart';

class DayStatistics extends Equatable {
  final double total;
  final List<Map<String, dynamic>> statistics;

  const DayStatistics({
    required this.total,
    required this.statistics,
  });

  static const empty = DayStatistics(total: 0, statistics: []);

  DayStatistics copyWith({
    double? total,
    List<Map<String, dynamic>>? statistics
  }) {
    return DayStatistics(
      total: total ?? this.total,
      statistics: statistics ?? this.statistics,
    );
  }

  factory DayStatistics.fromJson(List<Map<String, dynamic>> allStatistics) {
    final double sTotal = allStatistics.last['amount'];
    allStatistics.removeLast();
    return DayStatistics(
        total: sTotal,
        statistics: allStatistics
    );
  }

  @override
  List<Object> get props {
    return [
      total,
      statistics,
    ];
  }
}
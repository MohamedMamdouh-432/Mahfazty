part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  final int screenIdx, curIdx;

  const DashboardState({
    this.screenIdx = 0,
    this.curIdx = 0,
  });

  static const initial = DashboardState(screenIdx: 0, curIdx: 0);

  DashboardState copyWith({int? screenIdx, int? curIdx}) {
    return DashboardState(
      screenIdx: screenIdx ?? this.screenIdx,
      curIdx: curIdx ?? this.curIdx,
    );
  }

  @override
  List<Object> get props => [screenIdx, curIdx];
}

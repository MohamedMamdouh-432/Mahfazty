part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  final int screenIdx, curIdx, backPage;

  const DashboardState({
    this.screenIdx = 0,
    this.curIdx = 0,
    required this.backPage,
  });

  static const initial = DashboardState(screenIdx: 0, curIdx: 0, backPage: 0);

  DashboardState copyWith({int? screenIdx, int? curIdx, int? backPage}) {
    return DashboardState(
      screenIdx: screenIdx ?? this.screenIdx,
      curIdx: curIdx ?? this.curIdx,
      backPage: backPage ?? this.backPage,
    );
  }

  @override
  List<Object> get props => [screenIdx, curIdx, backPage];
}

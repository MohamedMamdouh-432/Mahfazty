import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/features/add/ui/screens/add_screen.dart';
import 'package:mahfazty/features/dashboard/ui/screens/enteries_screen.dart';
import 'package:mahfazty/features/dashboard/ui/screens/expenses_screen.dart';
import 'package:mahfazty/features/dashboard/ui/screens/notifications_screen.dart';
import 'package:mahfazty/features/dashboard/ui/screens/overview_screen.dart';
import 'package:mahfazty/features/dashboard/ui/screens/reminders_screen.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState.initial);

  Widget getScreen() {
    switch (state.screenIdx) {
      case 0:
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 1000),
          child: curPage(),
        );
      case 1:
        return Container();
      case 2:
        return AddScreen();
      case 3:
        return NotificationsScreen();
      default:
        return RemindersScreen();
    }
  }

  void changeScreen(int index) {
    emit(state.copyWith(screenIdx: index));
  }

  Widget curPage() {
    switch (state.curIdx) {
      case 0:
        return OverviewScreen();
      case 1:
        return ExpensesScreen();
      default:
        return EnteriesScreen(backPage: state.backPage);
    }
  }

  void changePage(int index, [int backPage = 0]) {
    emit(state.copyWith(curIdx: index, backPage: backPage));
  }
}

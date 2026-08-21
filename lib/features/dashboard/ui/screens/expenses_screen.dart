import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahfazty/features/dashboard/ui/components/expenses/expense_date_picker.dart';
import 'package:mahfazty/features/dashboard/ui/components/expenses/total_expenses.dart';
import 'package:mahfazty/features/dashboard/ui/components/expenses/visual_expenses_details.dart';
import 'package:mahfazty/features/dashboard/ui/components/head_bar_with_back_button.dart';
import 'package:mahfazty/features/dashboard/ui/components/overview/latest_entries.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: HeadBarWithBackButton(title: "Total Expenses", backPage: 0),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ExpenseDatePicker(),
              TotalExpenses(),
              VisualExpensesDetails(),
              LatestEntries(1),
            ]),
          ),
        ),
      ],
    );
  }
}

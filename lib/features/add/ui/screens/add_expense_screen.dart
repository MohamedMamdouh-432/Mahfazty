import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mahfazty/features/add/ui/components/add_expense_form.dart';
import 'package:mahfazty/features/dashboard/ui/components/expenses/expense_date_picker.dart';
import 'package:mahfazty/features/dashboard/ui/components/head_bar_with_back_button.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: HeadBarWithBackButton(title: "Add Expense", backPage: 0),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  ExpenseDatePicker(),
                  Gap(10.h),
                  AddExpenseForm(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

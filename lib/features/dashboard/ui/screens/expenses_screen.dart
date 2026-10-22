import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahfazty/core/services/di_service.dart';
import 'package:mahfazty/features/dashboard/ui/components/expenses/expense_date_picker.dart';
import 'package:mahfazty/features/dashboard/ui/components/expenses/total_expenses.dart';
import 'package:mahfazty/features/dashboard/ui/components/expenses/visual_expenses_details.dart';
import 'package:mahfazty/features/dashboard/ui/components/head_bar_with_back_button.dart';
import 'package:mahfazty/features/transactions/data/repos/transactions_repo.dart';
import 'package:mahfazty/features/transactions/logic/transaction_form_cubit/transaction_form_cubit.dart';

import '../components/expenses/expense_detailes_entries.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionFormCubit>(
        create: (context) => TransactionFormCubit(getIt<TransactionsRepo>()),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: HeadBarWithBackButton(title: "Total Expenses"),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  ExpenseDatePicker(),
                  TotalExpenses(),
                  VisualExpensesDetails(),
                  ExpenseDetailesEntries(),
                ]),
              ),
            ),
          ],
        ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mahfazty/core/services/di_service.dart';
import 'package:mahfazty/features/dashboard/ui/components/expenses/expense_date_picker.dart';
import 'package:mahfazty/features/dashboard/ui/components/head_bar_with_back_button.dart';
import 'package:mahfazty/features/transactions/data/repos/transactions_repo.dart';
import 'package:mahfazty/features/transactions/logic/transaction_form_cubit/transaction_form_cubit.dart';
import 'package:mahfazty/features/transactions/ui/components/add_transaction_form.dart';

class AddTransactionScreen extends StatelessWidget {
  const AddTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionFormCubit(getIt<TransactionsRepo>()),
      child: SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: HeadBarWithBackButton(title: "Add Transaction", backPage: 0),
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
      ),
    );
  }
}

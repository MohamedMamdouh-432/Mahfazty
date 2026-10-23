import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mahfazty/core/theming/colors.dart';
import 'package:mahfazty/features/dashboard/logic/dashboard_cubit/dashboard_cubit.dart';
import 'package:mahfazty/features/dashboard/ui/widgets/summary_card.dart';
import 'package:mahfazty/features/transactions/logic/transactions_cubit/transactions_cubit.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      decoration: BoxDecoration(color: ColorsManager.brighterGray),
      child: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          children: [
            SummaryCard(title: 'Total Salary', amount: "1,289.38"),
            Gap(10.w),
            SummaryCard(
              title: 'Total Expense',
              amount: "298.16",
              onTap: () {
                context.read<TransactionsCubit>().fetchDetailedTransactions(DateTime.now());
                context.read<DashboardCubit>().changePage(1);
              },
            ),
          ],
        ),
      ),
    );
  }
}

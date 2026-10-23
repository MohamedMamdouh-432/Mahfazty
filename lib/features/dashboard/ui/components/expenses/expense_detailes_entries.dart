import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mahfazty/core/data/enums/transaction_type.dart';
import 'package:mahfazty/core/theming/colors.dart';
import 'package:mahfazty/features/dashboard/logic/dashboard_cubit/dashboard_cubit.dart';
import 'package:mahfazty/features/dashboard/ui/widgets/latest_entry.dart';
import 'package:mahfazty/features/transactions/logic/transactions_cubit/transactions_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

import 'expenses_empty_entries.dart';

class ExpenseDetailesEntries extends StatelessWidget {
  const ExpenseDetailesEntries({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.sp),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Transaction Entries".text.size(18.sp).bold.make(),
          Gap(20.h),
          BlocBuilder<TransactionsCubit, TransactionsState>(
            buildWhen: (p, c) => p.detailedEnteries != c.detailedEnteries,
            builder: (_, state) => VxConditional(
              condition: state.dStatus == TransactionStatus.loading,
              builder: (_) => Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.lightBlue,
                ),
              ),
              fallback: (_) => VxConditional(
                condition:
                    state.dStatus == TransactionStatus.successWithoutData,
                builder: (_) => ExpensesEmptyEntries(),
                fallback: (_) => VxConditional(
                  condition: state.dStatus == TransactionStatus.success,
                  builder: (_) => ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.detailedEnteries.length,
                      itemBuilder: (c, i) => LatestEntry(state.detailedEnteries[i]),
                      separatorBuilder: (c, i) => Gap(20.h),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

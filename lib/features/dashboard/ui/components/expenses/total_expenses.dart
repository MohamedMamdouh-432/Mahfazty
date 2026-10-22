import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahfazty/core/theming/colors.dart';
import 'package:mahfazty/features/transactions/logic/transactions_cubit/transactions_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

class TotalExpenses extends StatelessWidget {
  const TotalExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsCubit, TransactionsState>(
        builder: (_, state) => Container(
          height: 40.h,
          margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.green.shade300,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Total Expenses:".text.size(16.sp).bold.make(),
              "${state.dayStatistics.total} EGP".text.size(16.sp).bold.make(),
            ],
          ),
        ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mahfazty/core/theming/colors.dart';
import 'package:mahfazty/features/dashboard/logic/dashboard_cubit/dashboard_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

class ExpensesEmptyEntries extends StatelessWidget {
  const ExpensesEmptyEntries({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/no_transactions.jpg',
            height: 120.h,
            width: double.infinity,
          ),
          "You didn't have any transactions".text
              .size(14.sp)
              .color(ColorsManager.brightGray)
              .makeCentered(),
        ],
      ),
    );
  }
}

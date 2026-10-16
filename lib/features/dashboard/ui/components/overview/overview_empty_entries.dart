import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mahfazty/core/theming/colors.dart';
import 'package:mahfazty/features/dashboard/logic/dashboard_cubit/dashboard_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

class OverviewEmptyEntries extends StatelessWidget {
  const OverviewEmptyEntries({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/no_transactions.jpg',
            height: 200.h,
            width: double.infinity,
          ),
          Gap(10.h),
          "You currently have no transactions.".text
              .size(16.sp)
              .color(ColorsManager.brightGray)
              .makeCentered(),
          TextButton(
            onPressed: () => context.read<DashboardCubit>().changeScreen(2),
            child: "+ Add new transaction".text
                .size(16.sp)
                .bold
                .color(ColorsManager.lightBlue)
                .makeCentered(),
          ),
        ],
      ),
    );
  }
}

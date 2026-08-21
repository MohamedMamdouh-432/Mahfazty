import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mahfazty/core/theming/colors.dart';
import 'package:mahfazty/features/dashboard/logic/cubit/dashboard_cubit.dart';
import 'package:mahfazty/features/dashboard/ui/widgets/summary_card.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      decoration: BoxDecoration(color: ColorsManager.brighterGray),
      child: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(20.sp),
          children: [
            SummaryCard(title: 'Total Salary', amount: "1,289.38"),
            Gap(10.w),
            SummaryCard(
              title: 'Total Expense',
              amount: "298.16",
              onTap: () => context.read<DashboardCubit>().changePage(1, 0),
            ),
            Gap(10.w),
            SummaryCard(title: 'Monthly Rate', amount: "3,385.50"),
          ],
        ),
      ),
    );
  }
}

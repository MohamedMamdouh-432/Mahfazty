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

class LatestEntries extends StatelessWidget {
  final int backPage;
  const LatestEntries(this.backPage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.sp),
      margin: const EdgeInsets.only(bottom: 10),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Latest Entries".text.size(18.sp).bold.make(),
              InkWell(
                borderRadius: BorderRadius.circular(10.r),
                onTap: () =>
                    context.read<DashboardCubit>().changePage(2, backPage),
                child: Container(
                  height: 30.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: ColorsManager.brightGray),
                  ),
                  child: Icon(Icons.more_horiz_rounded, size: 25.sp),
                ),
              ),
            ],
          ),
          Gap(20.h),
          BlocBuilder<TransactionsCubit, TransactionsState>(
            buildWhen: (p, c) => p.latestEnteries != c.latestEnteries,
            builder: (_, state) => VxConditional(
              condition: state.lStatus == TransactionStatus.loading,
              builder: (_) => Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.lightBlue,
                ),
              ),
              fallback: (_) => VxConditional(
                condition:
                    state.lStatus == TransactionStatus.successWithoutData,
                builder: (_) => Center(
                  child: "No Transaction yet !".text
                      .size(25.sp)
                      .color(ColorsManager.mainBlue)
                      .bold
                      .italic
                      .makeCentered(),
                ),
                fallback: (_) => VxConditional(
                  condition: state.lStatus == TransactionStatus.success,
                  builder: (_) {
                    final shortList = state.latestEnteries
                        .getRange(0, 6)
                        .toList();
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: shortList.length,
                      itemBuilder: (c, i) => LatestEntry(shortList[i]),
                      separatorBuilder: (c, i) => Gap(20.h),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

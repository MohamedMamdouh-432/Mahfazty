import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mahfazty/core/theming/colors.dart';
import 'package:mahfazty/features/dashboard/logic/cubit/dashboard_cubit.dart';
import 'package:mahfazty/features/dashboard/ui/widgets/latest_entry.dart';
import 'package:velocity_x/velocity_x.dart';

class LatestEntries extends StatelessWidget {
  final int backPage;
  final List enteries = [
    {
      "icon": Icons.money,
      "category": "Food",
      "date": "20 Feb 2024",
      "cost": "20\$ + 0.5% Vat",
      "paymentMethod": "Google Pay",
    },
    {
      "icon": Icons.directions_bike,
      "category": "Uber",
      "date": "13 Mar 2024",
      "cost": "18\$ + 0.8% Vat",
      "paymentMethod": "Cash",
    },
    {
      "icon": Icons.shopping_bag_outlined,
      "category": "Shopping",
      "date": "11 Mar 2024",
      "cost": "400\$ + 0.12% Vat",
      "paymentMethod": "Instapay",
    },
  ];
  LatestEntries(this.backPage, {super.key});

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
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: enteries.length,
            itemBuilder: (c, i) => LatestEntry(
              category: enteries[i]["category"],
              cost: enteries[i]["cost"],
              date: enteries[i]["date"],
              icon: enteries[i]["icon"],
              paymentMethod: enteries[i]["paymentMethod"],
            ),
            separatorBuilder: (c, i) => Gap(20.h),
          ),
        ],
      ),
    );
  }
}

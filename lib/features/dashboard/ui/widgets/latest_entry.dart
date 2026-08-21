import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mahfazty/core/theming/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class LatestEntry extends StatelessWidget {
  final IconData icon;
  final String category, date, cost, paymentMethod;

  const LatestEntry({
    super.key,
    required this.icon,
    required this.category,
    required this.date,
    required this.cost,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: ColorsManager.brighterGray,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Icon(icon, size: 28.sp),
        ),
        Gap(10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            category.text.size(18.sp).bold.make(),
            date.text.size(14.sp).bold.color(ColorsManager.gray).make(),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            cost.text.size(16.sp).bold.make(),
            paymentMethod.text
                .size(14.sp)
                .bold
                .color(ColorsManager.gray)
                .make(),
          ],
        ),
      ],
    );
  }
}

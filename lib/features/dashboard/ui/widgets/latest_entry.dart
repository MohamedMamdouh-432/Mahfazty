import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mahfazty/core/data/models/transaction.dart';
import 'package:mahfazty/core/theming/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class LatestEntry extends StatelessWidget {
  final Transaction transaction;

  const LatestEntry(this.transaction, {super.key});

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
          child: Icon(
            transaction.category!.icon,
            color: transaction.category!.color,
            size: 28.sp,
          ),
        ),
        Gap(10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            transaction.category!.name.text.size(18.sp).bold.make(),
            DateFormat("d MMM yyyy")
                .format(transaction.date.toLocal())
                .text
                .size(14.sp)
                .bold
                .color(ColorsManager.gray)
                .make(),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            "${transaction.amount} EGP".text.size(16.sp).bold.make(),
            (transaction.title ?? "").text
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

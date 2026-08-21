import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:velocity_x/velocity_x.dart';

class SummaryCard extends StatelessWidget {
  final String title, amount;
  final Function()? onTap;

  const SummaryCard({
    super.key,
    required this.title,
    required this.amount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 120.w,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: onTap == null ? Colors.white : Colors.blue,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.account_balance_wallet_outlined, size: 30.sp),
            Gap(5.h),
            title.text.size(14.sp).ellipsis.make(),
            Spacer(),
            "\$ $amount".text.size(18.sp).bold.ellipsis.make(),
          ],
        ),
      ),
    );
  }
}

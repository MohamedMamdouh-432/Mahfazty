import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahfazty/core/theming/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class AddTransactionItem extends StatelessWidget {
  final String title;
  bool isExpense = false;
  Function() onTap;
  AddTransactionItem({
    required this.title,
    required this.onTap,
    super.key,
    this.isExpense = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          color: isExpense ? ColorsManager.mainBlue : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          spacing: 5.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.account_balance_wallet_outlined,
              size: 28.sp,
              color: isExpense ? Colors.white : Colors.black,
            ),
            title.text
                .size(14.sp)
                .color(isExpense ? Colors.white : Colors.black)
                .make(),
          ],
        ),
      ),
    );
  }
}

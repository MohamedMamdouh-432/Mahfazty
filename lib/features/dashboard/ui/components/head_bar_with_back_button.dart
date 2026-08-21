import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mahfazty/features/dashboard/logic/cubit/dashboard_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

class HeadBarWithBackButton extends StatelessWidget {
  final String title;
  final int backPage;
  
  const HeadBarWithBackButton({
    super.key,
    required this.title,
    required this.backPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Color.fromARGB(255, 220, 219, 219)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha(1),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded, size: 20),
              onPressed: () =>
                  context.read<DashboardCubit>().changePage(backPage),
            ),
          ),
          Gap(70.w),
          title.text.size(20.sp).bold.make(),
        ],
      ),
    );
  }
}

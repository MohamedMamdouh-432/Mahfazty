import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mahfazty/core/theming/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class StarterScreen extends StatelessWidget {
  const StarterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/app_logo.png',
                height: 136.h,
                width: double.infinity,
              ),
              Gap(10.h),

              "Mahfazty".text
                  .size(28.sp)
                  .bold
                  .color(Colors.black87)
                  .makeCentered(),
              Gap(40.h),

              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  ColorsManager.mainBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

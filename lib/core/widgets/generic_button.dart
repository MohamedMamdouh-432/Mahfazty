import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahfazty/core/theming/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class GenericButton extends StatelessWidget {
  final String content;
  final void Function() onPressed;

  const GenericButton({
    super.key,
    required this.content,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              ColorsManager.mainBlue,
              ColorsManager.lightBlue,
              ColorsManager.lightBlue,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorsManager.mainBlue.withValues(alpha: 0.5),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: content.text.uppercase
            .letterSpacing(1)
            .color(Colors.white)
            .size(16.sp)
            .fontWeight(FontWeight.w500)
            .make(),
      ),
    );
  }
}

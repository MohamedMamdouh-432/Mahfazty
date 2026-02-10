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
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.mainBlue,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: content.text
          .size(16.sp)
          .color(Colors.white)
          .fontWeight(FontWeight.w600)
          .makeCentered(),
    );
  }
}

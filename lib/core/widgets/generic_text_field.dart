import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahfazty/core/theming/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class GenericTextField extends StatefulWidget {
  final String hint;
  final IconData preIcon;
  final bool isObsecure;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;

  const GenericTextField({
    super.key,
    required this.hint,
    required this.preIcon,
    required this.onChanged,
    this.validator,
    this.isObsecure = false,
  });

  @override
  State<GenericTextField> createState() => _GenericTextFieldState();
}

class _GenericTextFieldState extends State<GenericTextField> {
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: [],
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorsManager.brighterGray, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 10.0,
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorsManager.mainBlue, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          gapPadding: 10.0,
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorsManager.brightRed, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          gapPadding: 10.0,
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorsManager.brightRed, width: 1.5),
        ),
        filled: true,
        fillColor: ColorsManager.brightestGray,
        hint: widget.hint.text
            .size(14.sp)
            .color(ColorsManager.brightGray)
            .make(),
        prefixIcon: Icon(widget.preIcon, color: ColorsManager.gray),
        suffixIcon: widget.isObsecure
            ? IconButton(
                onPressed: () => setState(() => show = !show),
                icon: Icon(
                  show
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  color: ColorsManager.gray,
                ),
              )
            : null,
      ),
      obscureText: widget.isObsecure ? show : false,
      style: TextStyle(color: ColorsManager.darkBlue, fontSize: 14.sp),
      onChanged: widget.onChanged,
      validator: widget.validator,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mahfazty/core/theming/colors.dart';
import 'package:mahfazty/features/auth/logic/cubit/auth_cubit.dart';
import 'package:mahfazty/features/auth/logic/cubit/auth_state.dart';
import 'package:mahfazty/features/auth/ui/components/register_form.dart';
import 'package:velocity_x/velocity_x.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is AuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم التسجيل بنجاح! يمكنك الآن تسجيل الدخول.'),
            ),
          );
          context.pop();
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 100.h),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/app_logo.png',
                  height: 136.h,
                  width: double.infinity,
                ),
                Gap(10.h),
                RegisterForm(),
                Gap(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "Already have an account? ".text.size(14.sp).make(),
                    TextButton(
                      onPressed: () => context.pop(),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: 'Login here'.text
                          .color(ColorsManager.mainBlue)
                          .size(14.sp)
                          .make(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

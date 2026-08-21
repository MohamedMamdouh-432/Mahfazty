import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mahfazty/core/routing/routes.dart';
import 'package:mahfazty/core/theming/colors.dart';
import 'package:mahfazty/features/auth/logic/cubit/auth_cubit.dart';
import 'package:mahfazty/features/auth/logic/cubit/auth_state.dart';
import 'package:mahfazty/features/auth/ui/components/login_form.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            const SnackBar(content: Text('تم تسجيل الدخول بنجاح!')),
          );
          context.pushReplacement(Routes.dashboardScreen);
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
                LoginForm(),
                Gap(20.h),
                TextButton(
                  onPressed: () {},
                  child: "FORGOT PASSWORD".text.make(),
                ),
                Gap(40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "Don't have an account? ".text.size(14.sp).make(),
                    TextButton(
                      onPressed: () => context.push(Routes.registerScreen),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: 'Register here'.text
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

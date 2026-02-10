import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahfazty/core/routing/app_router.dart';
import 'package:mahfazty/core/theming/colors.dart';

class Launcher extends StatelessWidget {
  const Launcher({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp.router(
        routerConfig: appRouter,
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

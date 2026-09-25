import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahfazty/core/routing/app_router.dart';
import 'package:mahfazty/core/services/di_service.dart';
import 'package:mahfazty/core/theming/colors.dart';
import 'package:mahfazty/features/transactions/data/repos/transactions_repo.dart';
import 'package:mahfazty/features/transactions/logic/transactions_cubit/transactions_cubit.dart';

class Launcher extends StatelessWidget {
  const Launcher({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: BlocProvider(
        create: (ctx) =>
            TransactionsCubit(getIt<TransactionsRepo>())
              ..fetchLatestTransactions(),
        child: MaterialApp.router(
          routerConfig: appRouter,
          theme: ThemeData(
            primaryColor: ColorsManager.mainBlue,
            colorScheme: ColorScheme.fromSeed(
              seedColor: ColorsManager.mainBlue,
            ),
          ),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

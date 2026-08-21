import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mahfazty/core/di/dependency_injection.dart';
import 'package:mahfazty/core/routing/routes.dart';
import 'package:mahfazty/features/add/ui/screens/add_expense_screen.dart';
import 'package:mahfazty/features/add/ui/screens/add_income_screen.dart';
import 'package:mahfazty/features/auth/logic/cubit/auth_cubit.dart';
import 'package:mahfazty/features/auth/ui/screens/login_screen.dart';
import 'package:mahfazty/features/auth/ui/screens/register_screen.dart';
import 'package:mahfazty/features/dashboard/logic/cubit/dashboard_cubit.dart';
import 'package:mahfazty/features/dashboard/ui/dashboard_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: Routes.startScreen,
      builder: (context, state) => BlocProvider(
        create: (ctx) => AuthCubit(getIt()),
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: Routes.loginScreen,
      builder: (context, state) => BlocProvider(
        create: (ctx) => AuthCubit(getIt()),
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: Routes.registerScreen,
      builder: (context, state) => BlocProvider(
        create: (ctx) => AuthCubit(getIt()),
        child: const RegisterScreen(),
      ),
    ),
    GoRoute(
      path: Routes.dashboardScreen,
      builder: (context, state) => BlocProvider(
        create: (ctx) => DashboardCubit(),
        child: const DashboardScreen(),
      ),
    ),
    GoRoute(
      path: Routes.addExpenseScreen,
      builder: (context, state) => const AddExpenseScreen(),
    ),
    GoRoute(
      path: Routes.addIncomeScreen,
      builder: (context, state) => const AddIncomeScreen(),
    ),
  ],
);

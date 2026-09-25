import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mahfazty/core/routing/routes.dart';
import 'package:mahfazty/core/services/di_service.dart';
import 'package:mahfazty/features/auth/data/repos/auth_repo.dart';
import 'package:mahfazty/features/auth/logic/auth_notifier.dart';
import 'package:mahfazty/features/auth/logic/cubit/auth_cubit.dart';
import 'package:mahfazty/features/auth/ui/screens/login_screen.dart';
import 'package:mahfazty/features/auth/ui/screens/register_screen.dart';
import 'package:mahfazty/features/auth/ui/screens/starter_screen.dart';
import 'package:mahfazty/features/dashboard/logic/dashboard_cubit/dashboard_cubit.dart';
import 'package:mahfazty/features/dashboard/ui/dashboard_screen.dart';
import 'package:mahfazty/features/transactions/ui/screens/add_transaction_screen.dart';

final GoRouter appRouter = GoRouter(
  refreshListenable: getIt<AuthNotifier>(),
  initialLocation: Routes.startScreen,
  redirect: (BuildContext context, GoRouterState state) {
    final authNotifier = getIt<AuthNotifier>();

    // 1. Keep showing StarterScreen while checking cache/storage
    if (authNotifier.isLoading) return null;

    final bool isLoggedIn = authNotifier.isLoggedIn;
    final String location = state.matchedLocation;

    // Allowed routes for unauthenticated users
    final bool isAuthRoute =
        location == Routes.loginScreen || location == Routes.registerScreen;

    // 2. Unauthenticated user trying to access protected routes -> go to Login
    if (!isLoggedIn && !isAuthRoute) {
      return Routes.loginScreen;
    }

    // 3. Authenticated user trying to access Login, Register, or StarterScreen -> go to Dashboard
    if (isLoggedIn && (isAuthRoute || location == Routes.startScreen)) {
      return Routes.dashboardScreen;
    }

    return null;
  },
  routes: [
    GoRoute(
      path: Routes.startScreen,
      builder: (context, state) => const StarterScreen(),
    ),
    GoRoute(
      path: Routes.loginScreen,
      builder: (context, state) => BlocProvider(
        create: (ctx) => AuthCubit(getIt<AuthRepo>()),
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: Routes.registerScreen,
      builder: (context, state) => BlocProvider(
        create: (ctx) => AuthCubit(getIt<AuthRepo>()),
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
      path: Routes.addTransactionScreen,
      builder: (context, state) => const AddTransactionScreen(),
    ),
  ],
);

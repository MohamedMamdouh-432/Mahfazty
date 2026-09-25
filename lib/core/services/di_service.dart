import 'package:get_it/get_it.dart';
import 'package:mahfazty/core/networking/api_service.dart';
import 'package:mahfazty/core/services/database_service.dart';
import 'package:mahfazty/features/auth/data/repos/auth_repo.dart';
import 'package:mahfazty/features/auth/logic/auth_notifier.dart';
import 'package:mahfazty/features/transactions/data/repos/transactions_repo.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  // dio
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  // Authentication
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo());
  getIt.registerSingleton<AuthNotifier>(AuthNotifier());
  // Transactions
  getIt.registerLazySingleton<TransactionsRepo>(() => TransactionsRepo());
  // database provider
  getIt.registerSingleton<DBService>(DBService.instance);
}

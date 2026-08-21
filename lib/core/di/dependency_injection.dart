import 'package:get_it/get_it.dart';
import 'package:mahfazty/core/networking/api_service.dart';
import 'package:mahfazty/core/networking/dio_factory.dart';
import 'package:mahfazty/features/auth/data/repos/auth_repo.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  // dio
  final dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  // Authentication
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo());
}

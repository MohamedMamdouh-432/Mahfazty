import 'package:mahfazty/core/data/models/user.dart';
import 'package:mahfazty/core/helpers/constants.dart';
import 'package:mahfazty/core/services/cache_service.dart';
import 'package:mahfazty/core/services/database_service.dart';
import 'package:mahfazty/core/services/di_service.dart';

Future<User> registerUser(User user) async {
  final newUser = await getIt<DBService>().createUser(user);
  await CacheService.setData(Constants.userId, newUser.id);
  return newUser;
}

Future<String?> loginUser(User user) async {
  String? userId = await CacheService.getString(Constants.userId);
  if (userId == null) return 'you are not registered yet!';
  final storedUser = await getIt<DBService>().fetchUser(userId);
  if (storedUser == User.empty) return 'you are not registered yet!';
  if (user.credentials.identifier != storedUser.credentials.identifier)
    return 'Username is not correct!';
  if (user.credentials.password != storedUser.credentials.password)
    return 'Password is Wrong!';
  return null;
}

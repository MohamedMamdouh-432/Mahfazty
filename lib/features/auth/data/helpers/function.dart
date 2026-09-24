import 'package:mahfazty/core/data/models/user.dart';
import 'package:mahfazty/core/helpers/constants.dart';
import 'package:mahfazty/core/services/cache_service.dart';
import 'package:mahfazty/core/services/database_service.dart';
import 'package:mahfazty/core/services/di_service.dart';

Future<User> registerUser(User user) async {
  final newUser = await getIt<DBService>().createUser(user);
  return newUser;
}

Future<String?> loginUser(User user) async {
  // String? userId = await CacheService.getString(Constants.userId);
  // if (userId == null) return 'you are not registered yet!';
  if (user.credentials.identifier == '' || user.credentials.password == '')
    return 'Username or Password is empty!';
  final allUsers = await getIt<DBService>().fetchAllUsers();
  if (allUsers.isEmpty) return 'you are not registered yet!';
  User? storedUser;
  for (User dbUser in allUsers) {
    if (dbUser.credentials.identifier == user.credentials.identifier) {
      storedUser = dbUser;
      break;
    }
  }
  if (storedUser == null) return 'you are not registered yet!';
  if (storedUser.credentials.password != user.credentials.password)
    return 'Password is Wrong!';
  // for auto-login check when app start
  await CacheService.setSecuredString(Constants.userId, storedUser.id);
  return null;
}

import 'package:mahfazty/core/helpers/cache_helper.dart';
import 'package:mahfazty/core/helpers/constants.dart';
import 'package:mahfazty/features/auth/data/models/auth_request_body.dart';

void registerUser(AuthRequestBody authRequestBody) async {
  // use shared preferences to save the user data (Username, Password)
  await CacheHelper.setData(Constants.username, authRequestBody.username);
  await CacheHelper.setData(Constants.password, authRequestBody.password);
}

Future<String?> loginUser(AuthRequestBody authRequestBody) async {
  // use shared preferences to get the user data (Username, Password)
  final username = await CacheHelper.getString(Constants.username);
  if (username != authRequestBody.username) return 'إسم المستخدم غير صحيح';
  final password = await CacheHelper.getString(Constants.password);
  if (password != authRequestBody.password) return 'كلمة المرور غير صحيحة';
  return null;
}

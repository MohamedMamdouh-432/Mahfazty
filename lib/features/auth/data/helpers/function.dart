import 'package:mahfazty/core/helpers/cache_helper.dart';
import 'package:mahfazty/core/helpers/constants.dart';
import 'package:mahfazty/features/auth/data/models/auth_request_body.dart';

void registerUser(AuthRequestBody authRequestBody) async {
  // use shared preferences to save the user data (Username, Password)
  await CacheHelper.setData(Constants.username, authRequestBody.username);
  await CacheHelper.setData(Constants.password, authRequestBody.password);
}

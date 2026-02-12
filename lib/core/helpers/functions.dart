import 'package:mahfazty/core/helpers/cache_helper.dart';
import 'package:mahfazty/core/helpers/constants.dart';
import 'package:mahfazty/core/helpers/logger.dart';

Future<String> checkUserStatus() async {
  String username = (await CacheHelper.getString(Constants.username));
  Logger.info("Username: $username");
  return username.isEmpty ? Constants.notLoggingIn : Constants.loggingIn;
}

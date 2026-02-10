import 'package:mahfazty/core/helpers/cache_helper.dart';
import 'package:mahfazty/core/helpers/constants.dart';
import 'package:mahfazty/core/helpers/logger.dart';
import 'package:velocity_x/velocity_x.dart';

String userStatus = '';

Future<void> checkUserStatus() async {
  bool seenBefore = (await CacheHelper.getBool(Constants.seenBefore)) as bool;
  String userToken =
      (await CacheHelper.getSecuredString(Constants.userToken)) as String;
  Logger.info("Seen Before: $seenBefore");
  Logger.info("User Token: $userToken");

  // check if user open app for first time
  if (!seenBefore)
    userStatus = Constants.firstTime;
  // check if user is logged in
  else if (userToken.isEmptyOrNull)
    userStatus = Constants.notLoggingIn;
  else
    userStatus = Constants.loggingIn;
}

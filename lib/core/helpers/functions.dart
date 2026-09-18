import 'package:flutter/material.dart';
import 'package:mahfazty/core/services/di_service.dart';
import 'package:mahfazty/core/services/database_service.dart';

Future<void> initialize() async {
  // connect to database
  debugPrint('Connecting to Database ... 🔥');
  await getIt<DBService>().database;
}

// Future<String> checkUserStatus() async {
//   String username = (await CacheService.getString(Constants.username));
//   Logger.info("Username: $username");
//   return username.isEmpty ? Constants.notLoggingIn : Constants.loggingIn;
// }

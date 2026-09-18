import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahfazty/core/services/di_service.dart';
import 'package:mahfazty/core/helpers/functions.dart';
import 'package:mahfazty/launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI();
  await initialize();
  await ScreenUtil.ensureScreenSize();
  runApp(const Launcher());
}

import 'package:dio/dio.dart';
import 'package:mahfazty/core/helpers/cache_helper.dart';
import 'package:mahfazty/core/helpers/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    final String token =
        (await CacheHelper.getSecuredString(Constants.userToken) as String);
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  static void setUpdatedToken(String token) {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:mahfazty/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // @POST(ApiConstants.register)
  // Future<void> register(@Body() RegisterRequestBody registerRequestBody);
}

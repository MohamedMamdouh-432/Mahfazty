import 'package:mahfazty/features/auth/data/models/auth_request_body.dart';
import 'package:mahfazty/features/auth/data/helpers/function.dart';

class AuthRepo {
  Future<void> register(AuthRequestBody authRequestBody) async {
    registerUser(authRequestBody);
  }

  // Future<void> login(AuthRequestBody authRequestBody) async {

  // }
}

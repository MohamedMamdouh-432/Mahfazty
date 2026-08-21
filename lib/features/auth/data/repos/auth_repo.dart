import 'package:either_dart/either.dart';
import 'package:mahfazty/features/auth/data/helpers/function.dart';
import 'package:mahfazty/features/auth/data/models/auth_request_body.dart';

class AuthRepo {
  Future<void> register(AuthRequestBody authRequestBody) async {
    registerUser(authRequestBody);
  }

  Future<Either<String, Null>> login(AuthRequestBody authRequestBody) async {
    try {
      String? error = await loginUser(authRequestBody);
      if (error != null) return Left(error);
      return Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}

import 'package:either_dart/either.dart';
import 'package:mahfazty/core/data/models/user.dart';
import 'package:mahfazty/features/auth/data/helpers/function.dart';

class AuthRepo {
  Future<User> register(User user) async {
    return await registerUser(user);
  }

  Future<Either<String, Null>> login(User user) async {
    try {
      String? error = await loginUser(user);
      if (error != null) return Left(error);
      return Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}

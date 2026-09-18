import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/data/enums/auth_status.dart';
import 'package:mahfazty/core/data/models/user.dart';
import 'package:mahfazty/core/data/models/user_credentials.dart';
import 'package:mahfazty/features/auth/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthState.initial);

  void register(Map<String, String> authData) async {
    emit(state.copyWith(status: AuthStatus.inProgress));
    try {
      final user = state.user.copyWith(
        name: authData['name'],
        credentials: UserCredentials(
          identifier: authData['identifier'] ?? '',
          password: authData['password'] ?? '',
        ),
      );
      final newUser = await authRepo.register(user);
      emit(state.copyWith(status: AuthStatus.success, user: newUser));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.failure));
    }
  }

  void login(Map<String, String> authData) async {
    emit(state.copyWith(status: AuthStatus.inProgress));
    try {
      final user = state.user.copyWith(
        credentials: UserCredentials(
          identifier: authData['identifier'] ?? '',
          password: authData['password'] ?? '',
        ),
      );
      final res = await authRepo.login(user);
      res.fold(
        (error) =>
            emit(state.copyWith(status: AuthStatus.failure, errorMsg: error)),
        (v) => emit(state.copyWith(status: AuthStatus.success)),
      );
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.failure, errorMsg: e.toString()));
    }
  }
}

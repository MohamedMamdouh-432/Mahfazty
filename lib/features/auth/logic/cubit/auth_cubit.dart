import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/features/auth/data/models/auth_request_body.dart';
import 'package:mahfazty/features/auth/data/repos/auth_repo.dart';
import 'package:mahfazty/features/auth/logic/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthState.initial());

  void register(AuthRequestBody authData) async {
    emit(AuthState.loading());
    try {
      await authRepo.register(authData);
      emit(AuthState.success());
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }
}

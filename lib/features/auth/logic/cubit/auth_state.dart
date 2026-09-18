part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final User user;
  final AuthStatus status;
  final String? errorMsg;

  const AuthState({
    required this.user,
    required this.status,
    required this.errorMsg,
  });

  static final initial = AuthState(
    user: User.empty,
    status: AuthStatus.initial,
    errorMsg: null,
  );

  AuthState copyWith({User? user, AuthStatus? status, String? errorMsg}) {
    return AuthState(
      user: user ?? this.user,
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object?> get props => [user, status, errorMsg ?? ''];
}

import 'package:equatable/equatable.dart';

class UserCredentials extends Equatable {
  final String identifier;
  final String password;

  const UserCredentials({required this.identifier, required this.password});

  static const empty = UserCredentials(identifier: '', password: '');

  @override
  List<Object?> get props => [identifier, password];
}

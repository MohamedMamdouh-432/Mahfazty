import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String username;
  final String password;

  User({required this.username, required this.password});

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({String? username, String? password}) {
    return User(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}

import 'package:json_annotation/json_annotation.dart';

part 'auth_request_body.g.dart';

@JsonSerializable()
class AuthRequestBody {
  String username;
  String password;

  AuthRequestBody({required this.username, required this.password});

  Map<String, dynamic> toJson() => _$AuthRequestBodyToJson(this);

  AuthRequestBody copyWith({String? username, String? password}) {
    return AuthRequestBody(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthRequestBody _$AuthRequestBodyFromJson(Map<String, dynamic> json) =>
    AuthRequestBody(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthRequestBodyToJson(AuthRequestBody instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

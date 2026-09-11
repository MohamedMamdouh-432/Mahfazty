import 'package:equatable/equatable.dart';

import 'package:mahfazty/core/data/models/user_credentials.dart';

class User extends Equatable {
  final String id;
  final String name;
  final UserCredentials credentials;
  final String? email;
  final String? phone;
  final String language;
  final DateTime createdAt;
  final DateTime updatedAt;
  
  const User({
    required this.id,
    required this.name,
    required this.credentials,
    this.email,
    this.phone,
    required this.language,
    required this.createdAt,
    required this.updatedAt,
  });
  
  User copyWith({
    String? id,
    String? name,
    UserCredentials? credentials,
    String? email,
    String? phone,
    String? language,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      credentials: credentials ?? this.credentials,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      language: language ?? this.language,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      credentials,
      email ?? '',
      phone ?? '',
      language,
      createdAt,
      updatedAt,
    ];
  }
}

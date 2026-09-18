import 'package:equatable/equatable.dart';
import 'package:mahfazty/core/data/models/user_credentials.dart';

class User extends Equatable {
  final String id;
  final UserCredentials credentials;
  final String name;
  final String? email;
  final String? phone;
  final double? salary;
  final String language;
  final DateTime createdAt;
  final DateTime updatedAt;

  const User({
    required this.id,
    required this.credentials,
    required this.name,
    this.email,
    this.phone,
    this.salary,
    required this.language,
    required this.createdAt,
    required this.updatedAt,
  });

  static final empty = User(
    id: '',
    credentials: UserCredentials.empty,
    name: '',
    language: 'arabic',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  Map<String, String> toJson() => {
    "name": name,
    "identifier": credentials.identifier,
    "password": credentials.password,
    "language": language,
  };

  factory User.fromJson(Map<String, dynamic> jsonData) => User(
    id: jsonData['id'].toString(),
    credentials: UserCredentials(
      identifier: jsonData['identifier'],
      password: jsonData['password'],
    ),
    name: jsonData['name'],
    language: jsonData['language'],
    createdAt: DateTime.parse(
      jsonData['createdAt'].replaceFirst(' ', 'T'),
    ).toLocal(),
    updatedAt: DateTime.parse(
      jsonData['updatedAt'].replaceFirst(' ', 'T'),
    ).toLocal(),
  );

  User copyWith({
    String? id,
    UserCredentials? credentials,
    String? name,
    String? email,
    String? phone,
    double? salary,
    String? language,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => User(
    id: id ?? this.id,
    credentials: credentials ?? this.credentials,
    name: name ?? this.name,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    salary: salary ?? this.salary,
    language: language ?? this.language,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  @override
  List<Object> get props => [
    id,
    credentials,
    name,
    email ?? '',
    phone ?? '',
    salary ?? 0,
    language,
    createdAt,
    updatedAt,
  ];
}

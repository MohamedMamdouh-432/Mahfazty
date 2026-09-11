import 'package:equatable/equatable.dart';

import 'package:mahfazty/core/data/enums/account_type.dart';

class Account extends Equatable {
  final String id;
  final String userId;
  final String name;
  final AccountType type;
  final double balance;
  final String currency;
  final String? description;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedDate;
  
  const Account({
    required this.id,
    required this.userId,
    required this.name,
    required this.type,
    required this.balance,
    required this.currency,
    this.description,
    required this.isActive,
    required this.createdAt,
    required this.updatedDate,
  });

  Account copyWith({
    String? id,
    String? userId,
    String? name,
    AccountType? type,
    double? balance,
    String? currency,
    String? description,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedDate,
  }) {
    return Account(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      type: type ?? this.type,
      balance: balance ?? this.balance,
      currency: currency ?? this.currency,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      userId,
      name,
      type,
      balance,
      currency,
      description ?? '',
      isActive,
      createdAt,
      updatedDate,
    ];
  }
}

import 'package:equatable/equatable.dart';

import 'package:mahfazty/core/data/enums/transaction_type.dart';

class Transaction extends Equatable {
  final String id;
  final String userId;
  final String accountId;
  final String? categoryId;
  final TransactionType type;
  final double amount;
  final DateTime date;
  final String? title;
  final String? description;
  final String? note;
  final String? transferAccountId;
  final String? attachmentPath;
  final DateTime createdAT;
  final DateTime updatedAT;
  
  const Transaction({
    required this.id,
    required this.userId,
    required this.accountId,
    this.categoryId,
    required this.type,
    required this.amount,
    required this.date,
    this.title,
    this.description,
    this.note,
    this.transferAccountId,
    this.attachmentPath,
    required this.createdAT,
    required this.updatedAT,
  });

  Transaction copyWith({
    String? id,
    String? userId,
    String? accountId,
    String? categoryId,
    TransactionType? type,
    double? amount,
    DateTime? date,
    String? title,
    String? description,
    String? note,
    String? transferAccountId,
    String? attachmentPath,
    DateTime? createdAT,
    DateTime? updatedAT,
  }) {
    return Transaction(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      accountId: accountId ?? this.accountId,
      categoryId: categoryId ?? this.categoryId,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      title: title ?? this.title,
      description: description ?? this.description,
      note: note ?? this.note,
      transferAccountId: transferAccountId ?? this.transferAccountId,
      attachmentPath: attachmentPath ?? this.attachmentPath,
      createdAT: createdAT ?? this.createdAT,
      updatedAT: updatedAT ?? this.updatedAT,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      userId,
      accountId,
      categoryId ?? '',
      type,
      amount,
      date,
      title ?? '',
      description ?? '',
      note ?? '',
      transferAccountId ?? '',
      attachmentPath ?? '',
      createdAT,
      updatedAT,
    ];
  }
}

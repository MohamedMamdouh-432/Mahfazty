import 'package:equatable/equatable.dart';
import 'package:mahfazty/core/data/enums/transaction_type.dart';
import 'package:mahfazty/core/data/models/category.dart';

class Transaction extends Equatable {
  final String id;
  final String userId;
  final String accountId;
  final Category? category;
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
    this.category,
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

  static final Transaction empty = Transaction(
    id: '',
    userId: '',
    accountId: '',
    category: Category.empty,
    type: TransactionType.expense,
    amount: 0.0,
    date: DateTime.now(),
    createdAT: DateTime.now(),
    updatedAT: DateTime.now(),
  );

  Transaction copyWith({
    String? id,
    String? userId,
    String? accountId,
    Category? category,
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
      category: category ?? this.category,
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

  Map<String, Object> toJson() => {
    "userId": userId,
    "accountId": accountId,
    "categoryId": category?.id ?? '',
    "type": type.name,
    "amount": amount,
    "date": date.toIso8601String(),
    "title": title ?? '',
    "description": description ?? '',
    "note": note ?? '',
    "transferAccountId": transferAccountId ?? '',
    "attachmentPath": attachmentPath ?? '',
    "createdAT": createdAT.toIso8601String(),
    "updatedAT": updatedAT.toIso8601String(),
  };

  factory Transaction.fromJson(Map<String, dynamic> jsonData) => Transaction(
    id: jsonData['id'].toString(),
    userId: jsonData['userId'].toString(),
    accountId: jsonData['accountId'].toString(),
    category: Category.fromJson({
      "id": jsonData['categoryId'],
      "name": jsonData['name'],
      "type": jsonData['type'],
      "parentId": jsonData['parentId'],
      "icon": jsonData['icon'],
      "color": jsonData['color'],
      "description": jsonData['cdescription'],
    }),
    type: TransactionType.values.byName(jsonData['type']),
    amount: jsonData['amount'] as double,
    date: DateTime.parse(jsonData['date'].replaceFirst(' ', 'T')).toLocal(),
    title: jsonData['title'],
    description: jsonData['description'],
    note: jsonData['note'],
    transferAccountId: jsonData['transferAccountId'].toString(),
    attachmentPath: jsonData['attachmentPath'],
    createdAT: DateTime.parse(
      jsonData['createdAt'].replaceFirst(' ', 'T'),
    ).toLocal(),
    updatedAT: DateTime.parse(
      jsonData['updatedAt'].replaceFirst(' ', 'T'),
    ).toLocal(),
  );

  @override
  List<Object> get props {
    return [
      id,
      userId,
      accountId,
      category ?? Category.empty,
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

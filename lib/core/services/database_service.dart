import 'package:flutter/foundation.dart';
import 'package:mahfazty/core/data/models/transaction.dart' as m;
import 'package:mahfazty/core/data/models/user.dart';
import 'package:mahfazty/core/helpers/dummy.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBService {
  static Database? _database;
  final String dbFileName = 'mahfazty.db';

  DBService._init();
  // create an instance later in di or cubit
  static final DBService instance = DBService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _establishDB();
    return _database!;
  }

  Future<Database> _establishDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbFileName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, _) => _ensureDBTables(db),
    );
  }

  Future<void> _ensureDBTables(Database db) async {
    try {
      debugPrint("Creating the tables ... ▶️");

      // create users table
      await db.execute('''
        CREATE TABLE IF NOT EXISTS users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          email TEXT,
          phone TEXT,
          language TEXT NOT NULL DEFAULT 'arabic',
          identifier TEXT NOT NULL UNIQUE,
          password TEXT NOT NULL,
          createdAt TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
          updatedAt TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
        )
      ''');

      // Create Accounts Table
      await db.execute('''
          CREATE TABLE IF NOT EXISTS accounts (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            userId INTEGER NOT NULL,
            name TEXT NOT NULL,
            type TEXT NOT NULL DEFAULT 'cash' CHECK(type IN ('cash', 'bank', 'savings', 'eWallet', 'creditCard', 'other')),
            balance REAL NOT NULL DEFAULT 0.0,
            currency TEXT NOT NULL DEFAULT 'EGP',
            description TEXT,
            isActive INTEGER NOT NULL DEFAULT 1 CHECK(isActive IN (0, 1)),
            createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
            updatedAt TEXT DEFAULT CURRENT_TIMESTAMP,
            
            FOREIGN KEY(userId) REFERENCES users(id) ON DELETE CASCADE
          );
        ''');

      // Create Categories Table
      await db.execute('''
          CREATE TABLE IF NOT EXISTS categories (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            type TEXT NOT NULL CHECK(type IN ('income', 'expense')),
            parentId INTEGER,
            icon INTEGER,
            color INTEGER,
            description TEXT,
            
            FOREIGN KEY(parentId) REFERENCES categories(id) ON DELETE SET NULL
          );
        ''');

      // Create Transactions Table
      await db.execute('''
          CREATE TABLE IF NOT EXISTS transactions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            userId INTEGER NOT NULL,
            accountId INTEGER NOT NULL,
            categoryId INTEGER,
            type TEXT NOT NULL CHECK(type IN ('income', 'expense', 'transfer')),
            amount REAL NOT NULL DEFAULT 0.0,
            date TEXT DEFAULT CURRENT_TIMESTAMP,
            title TEXT,
            description TEXT,
            note TEXT,
            transferAccountId INTEGER,
            attachmentPath TEXT,
            createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
            updatedAt TEXT DEFAULT CURRENT_TIMESTAMP,
            
            FOREIGN KEY(userId) REFERENCES users(id) ON DELETE CASCADE,
            FOREIGN KEY(accountId) REFERENCES accounts(id) ON DELETE CASCADE,
            FOREIGN KEY(categoryId) REFERENCES categories(id) ON DELETE SET NULL,
            FOREIGN KEY(transferAccountId) REFERENCES accounts(id) ON DELETE SET NULL
          );
        ''');

      for (final user in users) await db.insert('users', user);
      for (final account in accounts) await db.insert('accounts', account);
      for (final cat in cats) await db.insert('categories', cat);
      for (final tran in trans) await db.insert('transactions', tran);

      debugPrint("All Tables are Successfully Created ✅");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<User> createUser(User user) async {
    final Database db = await instance.database;
    final int id = await db.insert("users", user.toJson());
    return user.copyWith(id: id.toString());
  }

  Future<List<User>> fetchAllUsers() async {
    final db = await instance.database;
    final records = await db.query("users");
    return records.map((record) => User.fromJson(record)).toList();
  }

  Future<User> fetchUser(String id) async {
    final db = await instance.database;
    final records = await db.query(
      "users",
      where: "id = ?",
      whereArgs: [int.parse(id)],
      limit: 1,
    );
    if (records.isEmpty) return User.empty;
    debugPrint(User.fromJson(records.first).toString());
    return User.fromJson(records.first);
  }

  Future<int> updateUser(String id, User user) async {
    final db = await instance.database;
    return await db.update(
      "users",
      user.toJson(),
      where: "id = ?",
      whereArgs: [int.parse(id)],
    );
  }

  Future<int> deleteUser(String id) async {
    final db = await instance.database;
    return await db.delete(
      "users",
      where: "id = ?",
      whereArgs: [int.parse(id)],
    );
  }

  Future<m.Transaction> createTransaction(m.Transaction transaction) async {
    final Database db = await instance.database;
    final int id = await db.insert("transactions", transaction.toJson());
    return transaction.copyWith(id: id.toString());
  }

  Future<List<m.Transaction>> fetchAllTransactions() async {
    final db = await instance.database;
    final records = await db.rawQuery('''
      SELECT * 
      FROM transactions INNER JOIN categories
        ON transactions.categoryId = categories.id
      ORDER BY transactions.date DESC
    ''');
    return records.map((record) => m.Transaction.fromJson(record)).toList();
  }

  Future<m.Transaction> fetchTransaction(String id) async {
    final db = await instance.database;
    final records = await db.query(
      "transactions",
      where: "id = ?",
      whereArgs: [int.parse(id)],
      limit: 1,
    );
    if (records.isEmpty) return m.Transaction.empty;
    debugPrint(m.Transaction.fromJson(records.first).toString());
    return m.Transaction.fromJson(records.first);
  }

  Future<int> updateTransaction(String id, m.Transaction transaction) async {
    final db = await instance.database;
    return await db.update(
      "transactions",
      transaction.toJson(),
      where: "id = ?",
      whereArgs: [int.parse(id)],
    );
  }

  Future<int> deleteTransaction(String id) async {
    final db = await instance.database;
    return await db.delete(
      "transactions",
      where: "id = ?",
      whereArgs: [int.parse(id)],
    );
  }
}

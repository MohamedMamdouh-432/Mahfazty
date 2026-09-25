import 'package:flutter/foundation.dart';
import 'package:mahfazty/core/data/models/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mahfazty/core/data/models/transaction.dart' as m;

class DBService {
  static Database? _database;
  final String dbFileName = 'mahfazty.db';
  final cats = [
    // =========================
    // INCOME
    // =========================
    {
      'name': 'Salary',
      'type': 'income',
      'icon': 'salary',
      'color': '#4CAF50',
      'description': 'Monthly salary or wages',
    },
    {
      'name': 'Freelance',
      'type': 'income',
      'icon': 'freelance',
      'color': '#2196F3',
      'description': 'Income from freelance work',
    },
    {
      'name': 'Business',
      'type': 'income',
      'icon': 'business',
      'color': '#9C27B0',
      'description': 'Income from business activities',
    },
    {
      'name': 'Investment',
      'type': 'income',
      'icon': 'investment',
      'color': '#FF9800',
      'description': 'Income from investments',
    },
    {
      'name': 'Gift',
      'type': 'income',
      'icon': 'gift',
      'color': '#E91E63',
      'description': 'Money received as a gift',
    },
    {
      'name': 'Bonus',
      'type': 'income',
      'icon': 'bonus',
      'color': '#00BCD4',
      'description': 'Bonuses and rewards',
    },
    {
      'name': 'Other Income',
      'type': 'income',
      'icon': 'other_income',
      'color': '#607D8B',
      'description': 'Other sources of income',
    },

    // =========================
    // EXPENSE
    // =========================
    {
      'name': 'Food & Dining',
      'type': 'expense',
      'icon': 'food',
      'color': '#FF5722',
      'description': 'Restaurants, meals and food',
    },
    {
      'name': 'Transportation',
      'type': 'expense',
      'icon': 'transportation',
      'color': '#3F51B5',
      'description': 'Fuel, taxis, public transportation and commuting',
    },
    {
      'name': 'Shopping',
      'type': 'expense',
      'icon': 'shopping',
      'color': '#E91E63',
      'description': 'Clothes, electronics and other shopping',
    },
    {
      'name': 'Bills & Utilities',
      'type': 'expense',
      'icon': 'utilities',
      'color': '#795548',
      'description': 'Electricity, water, gas, internet and bills',
    },
    {
      'name': 'Rent',
      'type': 'expense',
      'icon': 'rent',
      'color': '#673AB7',
      'description': 'House or apartment rent',
    },
    {
      'name': 'Healthcare',
      'type': 'expense',
      'icon': 'healthcare',
      'color': '#F44336',
      'description': 'Medical expenses, medicine and healthcare',
    },
    {
      'name': 'Entertainment',
      'type': 'expense',
      'icon': 'entertainment',
      'color': '#9C27B0',
      'description': 'Movies, games and entertainment',
    },
    {
      'name': 'Education',
      'type': 'expense',
      'icon': 'education',
      'color': '#009688',
      'description': 'Courses, books and education',
    },
    {
      'name': 'Subscriptions',
      'type': 'expense',
      'icon': 'subscriptions',
      'color': '#FF9800',
      'description': 'Monthly and yearly subscriptions',
    },
    {
      'name': 'Travel',
      'type': 'expense',
      'icon': 'travel',
      'color': '#03A9F4',
      'description': 'Trips, hotels and travel expenses',
    },
    {
      'name': 'Personal Care',
      'type': 'expense',
      'icon': 'personal_care',
      'color': '#8BC34A',
      'description': 'Haircuts, grooming and personal care',
    },
    {
      'name': 'Gifts & Donations',
      'type': 'expense',
      'icon': 'gifts',
      'color': '#E91E63',
      'description': 'Gifts, donations and charitable expenses',
    },
    {
      'name': 'Other Expense',
      'type': 'expense',
      'icon': 'other_expense',
      'color': '#607D8B',
      'description': 'Other expenses',
    },
  ];

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
      onOpen: _showSomeData,
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
            updatedAt TEXT,
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
            icon TEXT,
            color TEXT,
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

      for (final cat in cats) await db.insert('categories', cat);

      debugPrint("All Tables are Successfully Created ✅");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _showSomeData(Database db) async {
    final data = await db.query("users");
    debugPrint("Users Data :- 🔽");
    debugPrint(data.toString());
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
    final records = await db.query("transactions", orderBy: 'date DESC');
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

import 'package:mahfazty/core/helpers/logger.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static late Database db;
  DBProvider._();

  static Future<void> connectDB() async {
    db = await openDatabase(
      'mahfazty_db.db',
      version: 1,
      onOpen: (openedDB) async {
        try {
          // create users table
          await openedDB.execute('''
            CREATE TABLE IF NOT EXISTS users (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              name TEXT NOT NULL,
              email TEXT,
              phone TEXT,
              language TEXT NOT NULL DEFAULT 'en',
              createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
              updatedAt TEXT
            );
          ''');
          // Create Accounts Table
            await openedDB.execute('''
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
            await openedDB.execute('''
              CREATE TABLE IF NOT EXISTS categories (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT NOT NULL,
                type TEXT NOT NULL CHECK(type IN ('income', 'expense')),
                parentId INTEGER,
                icon TEXT,
                color TEXT,
                description TEXT,
                createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
                updatedAt TEXT,
                FOREIGN KEY(parentId) REFERENCES categories(id) ON DELETE SET NULL
              );
            ''');

            // Create Transactions Table
            await openedDB.execute('''
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
                updatedAt TEXT,
                FOREIGN KEY(userId) REFERENCES users(id) ON DELETE CASCADE,
                FOREIGN KEY(accountId) REFERENCES accounts(id) ON DELETE CASCADE,
                FOREIGN KEY(categoryId) REFERENCES categories(id) ON DELETE SET NULL,
                FOREIGN KEY(transferAccountId) REFERENCES accounts(id) ON DELETE SET NULL
              );
            ''');
            
          final users = await openedDB.rawQuery('SELECT * FROM users');
          Logger.info(users.toString());
        } catch (e) {
          Logger.debug(e.toString());
        }
      },
    );
  }
}

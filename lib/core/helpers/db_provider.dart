import 'package:sqflite/sqflite.dart';

class DBProvider {
  static late Database db;
  DBProvider._();

  static Future<void> connectDB() async {
    db = await openDatabase(
      'mahfazty_db.db',
      version: 1,
      onCreate: (Database createdDB, int version) async {
        // create users table
        await createdDB.execute('''
          CREATE TABLE IF NOT EXISTS users (
            id INT AUTO_INCREMENT PRIMARY KEY, 
            name VARCHAR(50) NOT NULL,
            email VARCHAR(60),
            phone VARCHAR(20),
            language VARCHAR(10) NOT NULL DEFAULT('en')
            createdAt DATETIME DEFAULT NOW(), 
            updatedAt DATETIME,
          );
        ''');
        // // create accounts table
        // await createdDB.execute('''
        //   CREATE TABLE IF NOT EXISTS accounts (
        //     id INT PRIMARY KEY AUTO_INCREMENT, 
        //     userId INT NOT NULL, 
        //     name VARCHAR(50) NOT NULL,
        //     type ENUM('cash', 'bank', 'savings', 'eWallet', 'creditCard', 'other') NOT NULL DEFAULT('cash'),
        //     balance DECIMAL(10, 2) NOT NULL DEFAULT(0.0),
        //     currency TEXT NOT NULL DEFAULT('EGP'),
        //     description TEXT,
        //     isActive TEXT NOT NULL,
        //     createdAt DATETIME DEFAULT NOW(), 
        //     updatedAt DATETIME,
            
        //     FOREIGN KEY(userId) REFERENCES users(id)
        //   );
        // ''');
        // // create categories table
        // await createdDB.execute('''
        //   CREATE TABLE IF NOT EXISTS categories (
        //     id INT PRIMARY KEY AUTO_INCREMENT, 
        //     name VARCHAR(50) NOT NULL,
        //     type ENUM('income', 'expense') NOT NULL,
        //     parentId INT,
        //     icon TEXT,
        //     color TEXT,
        //     description TEXT,
        //     createdAt DATETIME DEFAULT NOW(), 
        //     updatedAt DATETIME,
            
        //     FOREIGN KEY(parentId) REFERENCES categories(id)
        //   );
        // ''');
        // // create transactions table
        // await createdDB.execute('''
        //   CREATE TABLE IF NOT EXISTS transactions (
        //     id INT PRIMARY KEY AUTO_INCREMENT, 
        //     userId INT NOT NULL, 
        //     accountId INT NOT NULL, 
        //     categoryId INT,
        //     type ENUM('income', 'expense', 'transfer') NOT NULL,
        //     amount DECIMAL(10, 2) NOT NULL DEFAULT(0.0),
        //     date DATETIME DEFAULT NOW(),
        //     title VARCHAR(30),
        //     description TEXT,
        //     note TEXT,
        //     transferAccountId INT,
        //     attachmentPath TEXT,
        //     createdAt DATETIME DEFAULT NOW(), 
        //     updatedAt DATETIME,
            
        //     FOREIGN KEY(userId) REFERENCES users(id),
        //     FOREIGN KEY(accountId) REFERENCES accounts(id),
        //     FOREIGN KEY(categoryId) REFERENCES categories(id)
        //   );
        // ''');
      },
    );
  }
}

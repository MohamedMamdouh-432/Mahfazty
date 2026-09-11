import 'package:sqflite/sqflite.dart';

class DBProvider {
  static late Database db;
  DBProvider._();

  static Future<void> connectDB(String key) async {
    db = await openDatabase(
      'mahfazty_db.db',
      version: 1,
      onCreate: (Database createdDB, int version) async {
        await createdDB.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)',
        );
      },
    );
  }
}

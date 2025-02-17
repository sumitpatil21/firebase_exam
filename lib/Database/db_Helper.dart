import 'dart:developer';


import 'package:path/path.dart' as path;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {

  static DbHelper dbHelper=DbHelper._();
  DbHelper._();
  Database? _database;

 Future get database async => _database ?? await CreateDatabase();

  Future<Database?> CreateDatabase() async {
    log("Called...");
    final path = await getDatabasesPath();
    var dbpath = join(path, "budget.db");
    Database myDatabase = await openDatabase(
      dbpath,
      version: 1,
      onCreate: (db, version) async {
        String query = '''
       CREATE TABLE budget(
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       amount REAL,
       isincome INTEGER,
       date TEXT,
       category TEXT
       )
       ''';

        await db.execute(query);
        log("aa gaya bhai log");
      },
    );
    return myDatabase;
  }

  Future<void> insertRecord(
      double amount, String category, date, int isincome) async {
    Database? db = await database;
    String query = '''
   INSERT INTO budget
   (amount, category, date ,isincome)
   VALUES
   (?,?,?,?)
   ''';
    List args = [amount, category, date, isincome];
    int result = await db!.rawInsert(query, args);
    log("insert status $result");
    fetchData();
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    Database? db = await database;
    String query = "SELECT * FROM budget";
    List<Map<String, dynamic>> result = await db!.rawQuery(query);
    return result;
  }

  Future<void> deleteData(int id) async {
    Database? db = await database;
    String query = "DELETE FROM budget WHERE id = ?";
    List args = [id];
    await db!.rawDelete(query, args);
  }

  Future<void> updateRecord(
      double amount, String category, date, int isincome) async {
    Database? db = await database;
    String query = '''
   UPDATE budget SET amount = ?, isincome = ? WHERE category = ?
   (amount,isincome)
   VALUES
   (?,?)
   ''';
    List args = [amount , isincome];
    int result = await db!.rawInsert(query, args);
    log("Update status $result");
    fetchData();
  }


}
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class SqltiDB {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  // Initial db
  _initialDB() async {
    // get route for database
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'db_note.db');
    Database myDb = await openDatabase(path, onCreate: _onCreateDb, version: 1);
    return myDb;
  }

  _onCreateDb(Database db, int version) async {
    await db.execute('''
     CREATE TABLE notes (
      id INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
      Title  TEXT NOT NULL,
      Describe TEXT,
      Date DATETIME DEFAULT CURRENT_TIMESTAMP
     )
    ''');

    print("Oncreate =====================");
  }

  Future<List<dynamic>?> readData(String sql) async {
    Database? myDb = await db;
    List<Map> responses = await myDb!.rawQuery(sql);
    print(responses);
    return responses;
  }

  Future<int?> insertData(String sql, List arguments) async {
    Database? myDb = await db;
    int response = await myDb!.rawInsert(sql, arguments);
    return response;
  }

  updateData(String sql, List arguments) async {
    Database? myDb = await db;
    int response = await myDb!.rawUpdate(sql, arguments);
    return response;
  }

  deleteData(String sql, List arguments) async {
    Database? myDb = await db;
    int response = await myDb!.rawDelete(sql, arguments);
    return response;
  }
}

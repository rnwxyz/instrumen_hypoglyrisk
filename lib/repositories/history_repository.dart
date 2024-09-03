import 'package:instrumen_hypoglyrisk/models/history_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HistoryRepository {
  static HistoryRepository? _historyRepository;
  static late Database _database;

  HistoryRepository._internal() {
    _historyRepository = this;
  }

  factory HistoryRepository() =>
      _historyRepository ?? HistoryRepository._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  final String _tableName = 'history';

  Future<Database> _initializeDb() async {
    var db = openDatabase(
      join(await getDatabasesPath(), 'myapp_db.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName(
            id INTEGER PRIMARY KEY,
            name TEXT,
            gender TEXT,
            age INTEGER,
            rm TEXT,
            apoteker TEXT,
            date DATE,
            score_a INTEGER,
            score_b INTEGER
        )''',
        );
      },
      version: 1,
    );
    return db;
  }

  Future<int> insert(HistoryModel model) async {
    final Database db = await database;
    final result = await db.insert(_tableName, model.toMap());
    return result;
  }

  Future<List<HistoryModel>> get() async {
    final Database db = await database;
    String orderBy = 'id DESC';
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      orderBy: orderBy,
    );
    return results.map((e) => HistoryModel.fromMap(e)).toList();
  }

  Future<int> delete(int id) async {
    final db = await database;
    final result = await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }

  Future<int> update(HistoryModel model) async {
    final db = await database;
    final result = await db.update(
      _tableName,
      model.toMap(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
    return result;
  }

  Future<HistoryModel> getById(int id) async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return HistoryModel.fromMap(results.first);
  }

  Future<int> deleteAll() async {
    final db = await database;
    final result = await db.delete(_tableName);
    return result;
  }
}

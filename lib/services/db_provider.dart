import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sec_9_qrreader/models/models.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;

  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    // if (_database != null) return _database;
    // _database = await initDB();
    // return _database;

    _database ??= await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    // ignore: avoid_print
    print(path);
    // ignore: avoid_print
    print(documentsDirectory.path);

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database database, int version) async {
        await database.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          type TEXT,
          value TEXT
        )
        ''');
      },
    );
  }

  Future<int> nuevoScanRow_OLD(ScanModel scanModel) async {
    final db = await database; // get the data base

    final res = await db.rawInsert('''
    INSERT INTO Scans(id, type, value)
    VALUES (${scanModel.id},${scanModel.type},${scanModel.value});
    ''');

    return res;
  }

  Future<int> nuevoScanRow(ScanModel scanModel) async {
    final db = await database; // get the data base
    final res = await db.insert('Scans', scanModel.toMap());
    return res;
  }

  Future<ScanModel?> getScanByID(int id) async {
    final db = await database; // get the data base
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromMap(res.first) : null;
  }

  Future<List<ScanModel>> getAllScan() async {
    final db = await database; // get the data base
    final res = await db.query('Scans');

    return res.isNotEmpty
        ? res.map((scanModel) => ScanModel.fromMap(scanModel)).toList()
        : [];
  }

  Future<List<ScanModel>> getScansByType(String type) async {
    final db = await database; // get the data base
    final res = await db.rawQuery("SELECT * FROM Scans WHERE type = '$type'");

    return res.isNotEmpty
        ? res.map((scanModel) => ScanModel.fromMap(scanModel)).toList()
        : [];
  }

  Future<int> updateScan(ScanModel newScan) async {
    final db = await database; // get the data base
    final res = db.update(
      'Scans',
      newScan.toMap(),
      where: 'id = ?',
      whereArgs: [newScan.id],
    );

    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await database; // get the data base
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScans() async {
    final db = await database; // get the data base
    final res = await db.rawDelete(''' DELETE FROM Scans;''');
    return res;
  }
}

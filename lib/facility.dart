import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  var _db;

  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(join(await getDatabasesPath(), 'facility.db'),
        onCreate: (db, version) => _createDb(db), version: 1);
    return _db;
  }

  static void _createDb(Database db) {
    db.execute(
      "CREATE TABLE Facility(facilityName TEXT, category TEXT, operatingTime TEXT, contactNumber TEXT, location TEXT, extraInfo TEXT)",
    );
  }

  Future<bool> checkEmpty() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("Facility");
    return maps.isEmpty ? true : false;
  }

  Future<void> insertFacility(Facility facility) async {
    final db = await database;
    await db.insert("Facility", facility.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Facility>> getAllFacility() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("Facility");
    return List.generate(maps.length, (index) {
      return Facility(
          facilityName: maps[index]['facilityName'],
          category: maps[index]['category'],
          operatingTime: maps[index]['operatingTime'],
          contactNumber: maps[index]['contactNumber'],
          location: maps[index]['location'],
          extraInfo: maps[index]['extraInfo']);
    });
  }

  Future<dynamic> getFacility(String name) async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('Facility', where: 'facilityName=?', whereArgs: [name]);
    return maps.isNotEmpty ? maps : null;
  }

  Future<void> updateFacility(Facility facility) async {
    final db = await database;
    await db.update('Facility', facility.toJson(),
        where: 'facilityName=?', whereArgs: [facility.facilityName]);
  }

  Future<void> deleteFacility(String name) async {
    final db = await database;
    await db.delete('Facility', where: 'facilityName=?', whereArgs: [name]);
  }

  Future<void> deleteAllFacility() async {
    final db = await database;
    db.execute('DELETE FROM Facility');
  }
}

class Facility {
  final String facilityName;
  final String category;
  final String? operatingTime;
  final String? contactNumber;
  final String location;
  final String? extraInfo;
  Facility(
      {required this.facilityName,
      required this.category,
      this.operatingTime,
      this.contactNumber,
      required this.location,
      this.extraInfo});

  factory Facility.fromJson(Map<String, dynamic> json) =>
      _facilityFromJson(json);

  Map<String, dynamic> toJson() => _facilityToJson(this);
}

Facility _facilityFromJson(Map<String, dynamic> json) {
  return Facility(
      facilityName: json['facilityName'] as String,
      category: json['category'] as String,
      operatingTime: json['operatingTime'] as String,
      contactNumber: json['contactNumber'] as String,
      location: json['location'] as String,
      extraInfo: json['extraInfo'] as String?);
}

Map<String, dynamic> _facilityToJson(Facility instance) => <String, dynamic>{
      'facilityName': instance.facilityName,
      'category': instance.category,
      'operatingTime': instance.operatingTime,
      'contactNumber': instance.contactNumber,
      'location': instance.location,
      'extraInfo': instance.extraInfo
    };

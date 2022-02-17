// import 'dart:io';
//
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
//
// class DatabaseHelper{
//
//   static const _databaseName = "Contacts.db";
//   static const _databaseVersion = 1;
//
//
//   static const table = "my_table";
//
//   static const columnId = "_id";
//   static const columnName = "name";
//   static const columnPhone = "phone";
//
//   DatabaseHelper._privateConstructor();
//   static final DatabaseHelper instance  = DatabaseHelper._privateConstructor();
//
//   Database? _database;
//   Future<Database?> get database async{
//     if (_database != null) return _database;
//     _database = await _initDatabase();
//     return _database;
//   }
//
//   _initDatabase()async{
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//       String path = join(documentsDirectory.path, _databaseName);
//       return await openDatabase(path,
//       version: _databaseVersion,
//       onCreate: _onCreate
//     );
//   }
//
//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//           CREATE TABLE $table (
//             $columnId INTEGER PRIMARY KEY,
//             $columnName TEXT NOT NULL,
//             $columnPhone TEXT NOT NULL
//           )
//           ''');
//   }
//
//   Future<int> insert(Map<String, dynamic> row) async {
//     Database? db = await instance.database;
//     return await db!.insert(table, row);
//   }
//
//   Future<List<Map<String, dynamic>>> queryAllRows() async {
//     Database? db = await instance.database;
//     return await db!.query(table);
//   }
//
//   Future<int?> queryRowCount() async {
//     Database? db = await instance.database;
//     return Sqflite.firstIntValue(await db!.rawQuery('SELECT COUNT(*) FROM $table'));
//   }
//
//   Future<int> update(Map<String, dynamic> row) async {
//     Database? db = await instance.database;
//     int id = row[columnId];
//     return await db!.update(table, row, where: '$columnId = ?', whereArgs: [id]);
//   }
//
//   queryRow(int rowId) async {
//
//     Database? db = await DatabaseHelper.instance.database;
//
//     // get single row
//     List<String> columnsToSelect = [
//       DatabaseHelper.columnId,
//       DatabaseHelper.columnName,
//       DatabaseHelper.columnPhone,
//     ];
//     String whereString = '${DatabaseHelper.columnId} = ?';
//     // int rowId = 1;
//     List<dynamic> whereArguments = [rowId];
//     List<Map> result = await db!.query(
//         DatabaseHelper.table,
//         columns: columnsToSelect,
//         where: whereString,
//         whereArgs: whereArguments);
//
//     result.forEach((row) => print(row));
//     print(rowId);
//
//
//   }
//   // DatabaseHelper(this.columnId,)
//
// }
//
// // saveContact1(String name,num phone){
// //
// // }
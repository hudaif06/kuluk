import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../db_test.dart';
import '../contact/presenter.dart';
// class ContactModel {
//   final int id;
//   final String name;
//   dynamic phone;
//
//   ContactModel({
//     required this.id,
//     required this.name,
//     required this.phone,
//   });
//
//
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'phone': phone,
//     };
//   }
//
//   // Implement toString to make it easier to see information about
//
//   @override
//   String toString() {
//     return 'Contact{id: $id, name: $name, phone: $phone}';
//   }
// }

class GetContactsModel{

  getContacts()async{
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'test_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, phone TEXT)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
    return database;
  }
  Future<void> insertContact(ContactCreatedByMe contact) async {
    // Get a reference to the database.
    dynamic database = getContacts();
    final db = await database;

    await db.insert(
      'contacts',
      contact.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<List<ContactCreatedByMe>> contacts() async {
    // Get a reference to the database.
    dynamic database = getContacts();
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('contacts');
// print(maps);

    return List.generate(maps.length, (i) {
      return ContactCreatedByMe(
        id: maps[i]['id'],
        name: maps[i]['name'],
        phone: maps[i]['phone'],
      );

    });
  }

  // ContactList? objContactList;
  //
  // displayContact1(){
  //   if(contacts){
  //     objContactList?.showName = objContactList?.contactName1;
  //   }
  //   else{
  //     objContactList?.showName = contacts();
  //   }
  // }
}
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:kuluk_app/screens/get_contacts/presenter.dart';

class Test {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  dynamic database = GetContactsModel().getContacts();

  // Define a function that inserts dogs into the database

  // Future<void> insertContact2(Contact contact) async {
  //   // Get a reference to the database.
  //   final db = await database;
  //
  //   // Insert the Dog into the correct table. You might also specify the
  //   // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //   //
  //   // In this case, replace any previous data.
  //   await db.insert(
  //     'contacts',
  //     contact.toMap(),
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }
  //
  // Future<void> insertContact3(Contact contact) async {
  //   // Get a reference to the database.
  //   final db = await database;
  //
  //   // Insert the Dog into the correct table. You might also specify the
  //   // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //   //
  //   // In this case, replace any previous data.
  //   await db.insert(
  //     'contacts',
  //     contact.toMap(),
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }
  //
  // Future<void> insertContact4(Contact contact) async {
  //   // Get a reference to the database.
  //   final db = await database;
  //
  //   // Insert the Dog into the correct table. You might also specify the
  //   // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //   //
  //   // In this case, replace any previous data.
  //   await db.insert(
  //     'contacts',
  //     contact.toMap(),
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<ContactCreatedByMe>> contacts() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('contacts');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return ContactCreatedByMe(
        id: maps[i]['id'],
        name: maps[i]['name'],
        phone: maps[i]['phone'],
      );
    });
    // print(await contacts());
  }

  Future<void> updateContact(ContactCreatedByMe contact) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'contacts',
      contact.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [contact.id],
    );
  }

  Future<void> deleteContact(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'contacts',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  // Create a Dog and add it to the dogs table
  // var contact1 = Contact(
  //   id: 0,
  //   name: 'Billy',
  //   phone: 1234567899,
  // );
  //
  // var contact2 = Contact(
  //   id: 1,
  //   name: 'Aby',
  //   phone: 1234560000,
  // );
  //
  // var contact3 = Contact(
  //   id: 2,
  //   name: 'Tintu',
  //   phone: 1234123456,
  // );
  //
  // var contact4 = Contact(
  //   id: 3,
  //   name: 'Lalu',
  //   phone: 1111111111,
  // );

  // await insertContact1(contact1);
  // await insertContact1(contact2);
  // await insertContact1(contact3);
  // await insertContact1(contact4);

  // Now, use the method above to retrieve all the dogs.
  print(await contacts()); // Prints a list that include Fido.

  // Update Fido's age and save it to the database.
  // contact1 = Contact(
  //   id: contact1.id,
  //   name: contact1.name,
  //   phone: 1234567009,
  // );
  // await updateContact(contact1);

  // Print the updated results.
  // print(await contacts()); // Prints Fido with age 42.

  // Delete Fido from the database.
  // await deleteContact(contact1.id);

  // Print the list of dogs (empty).
  // print(await contacts());
}

class ContactCreatedByMe {
  final int id;
  final String name;
  dynamic phone;

  ContactCreatedByMe({
    required this.id,
    required this.name,
    required this.phone,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Contact{id: $id, name: $name, phone: $phone}';
  }
}

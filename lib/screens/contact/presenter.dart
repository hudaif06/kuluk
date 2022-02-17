import '../../db_test.dart';
import '../get_contacts/presenter.dart';

 class ContactList{
   // List<Contact>? contacts;
   ContactCreatedByMe? objContactModel;
   GetContactsModel? objGetContact;

   var showName;

  String contactName1 = "contact name";
  String contactName2 = "contact name";
  String contactName3 = "contact name";
  String contactName4 = "contact name";

  String contactNum1 = "";
  String contactNum2 = "";
  String contactNum3 = "";
  String contactNum4 = "";

   // displayContact1(){
   //   if(objGetContact?.contacts() == null){
   //      showName = contactName1;
   //   }
   //   else{
   //     showName = objGetContact?.contacts();
   //   }
   // }
}

// final dbHelper = DatabaseHelper.instance;
//
// void insert(String name,String phone) async {
//   Map<String, dynamic> row = {
//     DatabaseHelper.columnName : name,
//     DatabaseHelper.columnPhone  : phone
//   };
//   final id = await dbHelper.insert(row);
// }
//
//
// update(int id, String name,String phone) async {
//   int? rowId;
//   Database? db = await DatabaseHelper.instance.database;
//
//   Map<String, dynamic> row = {
//     DatabaseHelper.columnName : name,
//     DatabaseHelper.columnPhone  : phone
//   };
//
//   int updateCount = await db!.update(
//       DatabaseHelper.table,
//       row,
//       where: '${DatabaseHelper.columnId} = ?',
//       whereArgs: [id]);
//
//   // print(await db.query(DatabaseHelper.table));
//   // print(row);
// }
//
// queryRow(int rowId) async {
//
//   Database? db = await DatabaseHelper.instance.database;
//
//   List<String> columnsToSelect = [
//     DatabaseHelper.columnId,
//     DatabaseHelper.columnName,
//     DatabaseHelper.columnPhone,
//   ];
//   String whereString = '${DatabaseHelper.columnId} = ?';
//
//   List<dynamic> whereArguments = [rowId];
//   List<Map> result = await db!.query(
//       DatabaseHelper.table,
//       columns: columnsToSelect,
//       where: whereString,
//       whereArgs: whereArguments);
//
//   // result.forEach((row) => print(row));
// }
//

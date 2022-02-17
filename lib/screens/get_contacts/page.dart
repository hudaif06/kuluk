import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kuluk/db_test.dart';
import 'package:kuluk/screens/contact/presenter.dart';
import 'package:kuluk/screens/get_contacts/presenter.dart';
import 'package:sqflite/sqflite.dart';
import '../contact/page.dart';


class GetContactsPage extends StatefulWidget {
  const GetContactsPage({Key? key}) : super(key: key);

  @override
  _GetContactsPageState createState() => _GetContactsPageState();
}

class _GetContactsPageState extends State<GetContactsPage> {
  List<Contact>? contacts;
  Database? database;
  // var db;
ContactList contactList = ContactList();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContact();
    // contactCalling();
  }
  // void contactCalling() async{
  //   db = await openDatabase('Contacts.db').then((value) => () async{
  //     List<Map> list = await db.rawQuery('SELECT * FROM my_table');
  //     print(list);
  //   });
  //
  // }

  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      // print(contacts);
      setState(() {});

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Choose a contact",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.black38,
          elevation: 10,
        ),
        body: (contacts) == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: contacts!.length,
          itemBuilder: (BuildContext context, int index) {
            Uint8List? image = contacts![index].photo;
            String num = (contacts![index].phones.isNotEmpty) ? (contacts![index].phones.first.number) : "--";
            return ListTile(
                leading: (contacts![index].photo == null)
                    ? const CircleAvatar(child: Icon(Icons.person))
                    : CircleAvatar(backgroundImage: MemoryImage(image!)),
                title: Text(
                    "${contacts![index].name.first} ${contacts![index].name.last}"),
                subtitle: Text(num),
                onTap: () {

                  if (contacts![index].phones.isNotEmpty) {
                    GetContactsModel obj_getContact = GetContactsModel();
                    // ContactPage objContactPage;
                    obj_getContact.insertContact(ContactCreatedByMe(id: 0,name: contacts![index].name.first+" "+contacts![index].name.last,phone: contacts![index].phones.first.number));
                    obj_getContact.contacts();
                    // print("name: ${contacts![index].name.first+" "+contacts![index].name.last}, number: ${contacts![index].phones.first.number}");
                    var contactName = contacts![index].name.first+" "+contacts![index].name.last;
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ContactPage()));

                    // Navigator.pop(context);
                    // launch('tel: $num');

                  }
                  else{
                    Fluttertoast.showToast(
                        msg: "Empty phone number",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        // backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 20
                    );
                  }
                });
          },
        ));

  }

}


class GetContactsPage1 extends StatefulWidget {
  const GetContactsPage1({Key? key}) : super(key: key);

  @override
  _GetContactsPage1State createState() => _GetContactsPage1State();
}

class _GetContactsPage1State extends State<GetContactsPage1> {
  List<Contact>? contacts;
  Database? database;
  // var db;
  ContactList contactList = ContactList();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContact();
    // contactCalling();
  }
  // void contactCalling() async{
  //   db = await openDatabase('Contacts.db').then((value) => () async{
  //     List<Map> list = await db.rawQuery('SELECT * FROM my_table');
  //     print(list);
  //   });
  //
  // }

  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      // print(contacts);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Choose a contact",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.black38,
          elevation: 10,
        ),
        body: (contacts) == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: contacts!.length,
          itemBuilder: (BuildContext context, int index) {
            Uint8List? image = contacts![index].photo;
            String num = (contacts![index].phones.isNotEmpty) ? (contacts![index].phones.first.number) : "--";
            return ListTile(
                leading: (contacts![index].photo == null)
                    ? const CircleAvatar(child: Icon(Icons.person))
                    : CircleAvatar(backgroundImage: MemoryImage(image!)),
                title: Text(
                    "${contacts![index].name.first} ${contacts![index].name.last}"),
                subtitle: Text(num),
                onTap: () {

                  if (contacts![index].phones.isNotEmpty) {
                    GetContactsModel obj_getContact = GetContactsModel();
                    // ContactPage objContactPage;
                    obj_getContact.insertContact(ContactCreatedByMe(id: 1,name: contacts![index].name.first+" "+contacts![index].name.last,phone: contacts![index].phones.first.number));
                    obj_getContact.contacts();
                    var contactName = contacts![index].name.first+" "+contacts![index].name.last;
                    // update(2,contacts![index].name.first,contacts![index].phones.first.number);

                    // print("name: ${contacts![index].name.first+" "+contacts![index].name.last}, number: ${contacts![index].phones.first.number}");
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ContactPage()));
                    // print("contact2: ${contacts![2].name}");
                    // Navigator.pop(context);
                    // launch('tel: $num');

                  }
                  else{
                    Fluttertoast.showToast(
                        msg: "Empty phone number",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        // backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 20
                    );
                  }
                });
          },
        ));

  }

}


class GetContactsPage2 extends StatefulWidget {
  const GetContactsPage2({Key? key}) : super(key: key);

  @override
  _GetContactsPage2State createState() => _GetContactsPage2State();
}

class _GetContactsPage2State extends State<GetContactsPage2> {
  List<Contact>? contacts;
  Database? database;
  // var db;
  ContactList contactList = ContactList();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContact();
    // contactCalling();
  }
  // void contactCalling() async{
  //   db = await openDatabase('Contacts.db').then((value) => () async{
  //     List<Map> list = await db.rawQuery('SELECT * FROM my_table');
  //     print(list);
  //   });
  //
  // }

  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      // print(contacts);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Choose a contact",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.black38,
          elevation: 10,
        ),
        body: (contacts) == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: contacts!.length,
          itemBuilder: (BuildContext context, int index) {
            Uint8List? image = contacts![index].photo;
            String num = (contacts![index].phones.isNotEmpty) ? (contacts![index].phones.first.number) : "--";
            return ListTile(
                leading: (contacts![index].photo == null)
                    ? const CircleAvatar(child: Icon(Icons.person))
                    : CircleAvatar(backgroundImage: MemoryImage(image!)),
                title: Text(
                    "${contacts![index].name.first} ${contacts![index].name.last}"),
                subtitle: Text(num),
                onTap: () {

                  if (contacts![index].phones.isNotEmpty) {
                    GetContactsModel obj_getContact = GetContactsModel();
                    // ContactPage objContactPage;
                    obj_getContact.insertContact(ContactCreatedByMe(id: 2,name: contacts![index].name.first+" "+contacts![index].name.last,phone: contacts![index].phones.first.number));
                    obj_getContact.contacts();
                    // update(2,contacts![index].name.first,contacts![index].phones.first.number);

                    // print("name: ${contacts![index].name.first+" "+contacts![index].name.last}, number: ${contacts![index].phones.first.number}");
                    var contactName = contacts![index].name.first+" "+contacts![index].name.last;
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ContactPage()));
                    // print("contact2: ${contacts![2].name}");
                    // Navigator.pop(context);
                    // launch('tel: $num');

                  }
                  else{
                    Fluttertoast.showToast(
                        msg: "Empty phone number",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        // backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 20
                    );
                  }
                });
          },
        ));

  }

}


class GetContactsPage3 extends StatefulWidget {
  const GetContactsPage3({Key? key}) : super(key: key);

  @override
  _GetContactsPage3State createState() => _GetContactsPage3State();
}

class _GetContactsPage3State extends State<GetContactsPage3> {
  List<Contact>? contacts;
  Database? database;
  // var db;
  ContactList contactList = ContactList();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContact();
    // contactCalling();
  }
  // void contactCalling() async{
  //   db = await openDatabase('Contacts.db').then((value) => () async{
  //     List<Map> list = await db.rawQuery('SELECT * FROM my_table');
  //     print(list);
  //   });
  //
  // }

  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      // print(contacts);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Choose a contact",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.black38,
          elevation: 10,
        ),
        body: (contacts) == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: contacts!.length,
          itemBuilder: (BuildContext context, int index) {
            Uint8List? image = contacts![index].photo;
            String num = (contacts![index].phones.isNotEmpty) ? (contacts![index].phones.first.number) : "--";
            return ListTile(
                leading: (contacts![index].photo == null)
                    ? const CircleAvatar(child: Icon(Icons.person))
                    : CircleAvatar(backgroundImage: MemoryImage(image!)),
                title: Text(
                    "${contacts![index].name.first} ${contacts![index].name.last}"),
                subtitle: Text(num),
                onTap: () {

                  if (contacts![index].phones.isNotEmpty) {
                    GetContactsModel obj_getContact = GetContactsModel();
                    // ContactPage objContactPage;
                    obj_getContact.insertContact(ContactCreatedByMe(id: 3,name: contacts![index].name.first+" "+contacts![index].name.last,phone: contacts![index].phones.first.number));
                    obj_getContact.contacts();
                    // update(2,contacts![index].name.first,contacts![index].phones.first.number);

                    // print("name: ${contacts![index].name.first+" "+contacts![index].name.last}, number: ${contacts![index].phones.first.number}");
                    var contactName = contacts![index].name.first+" "+contacts![index].name.last;
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ContactPage()));
                    // print("contact2: ${contacts![2].name}");
                    // Navigator.pop(context);
                    // launch('tel: $num');

                  }
                  else{
                    Fluttertoast.showToast(
                        msg: "Empty phone number",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        // backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 20
                    );
                  }
                });
          },
        ));

  }

}

import 'package:flutter/material.dart';
import 'package:kuluk/screens/contact/presenter.dart';
import 'package:kuluk/util/font_constants.dart';

import '../../db_test.dart';
import '../app_bar_list/list_actions.dart';
import '../get_contacts/page.dart';
import '../get_contacts/presenter.dart';

class ContactPage extends StatefulWidget {
  // final String contactName;
  const ContactPage( {Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<ContactCreatedByMe> contactsList = [];
  ContactCreatedByMe? objContactModel;
  GetContactsModel? objGetContactsModel;
 ContactList contactList= ContactList();

  String get contactName => contactName;
 // int? newId;
 // List<ModelOfDatabaseContacts> contact = [];
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // readContact();
    // print(contactList);
  }

void readContact() async{
   setState(() {
     // contactsList = (await objGetContactsModel?.contacts())!;
     for(int i = 0;i<contactsList.length;i++){

     print(contactsList[i].name);
     }
   });

}
  // @override
  // void initState() {
  //  TODO: implement initState
  //   super.initState();
  // queryRow(3);
  // update(3,"sam","9996");
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/bg_image.png",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,fit: BoxFit.cover,),Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),child: _appBar()),
        body: _body(),

      ),]
    );
  }

  Widget _appBar(){
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text("Kuluk",style: FontConstants.W_LargeFont,),
      actions: [
        _popUpMenu()
      ],
    );
  }

 Widget  _popUpMenu(){
   return PopupMenuButton(itemBuilder: (context)=>[
     const PopupMenuItem(child: Text("Help"),value: 0,),
     const PopupMenuItem(child: Text("About"),value: 1,),
     const PopupMenuItem(child: Text("Contact Us      "),value: 2,),
   ],onSelected: (item) => selectedItem(context, item),
   );
 }

  Widget _body() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.fromLTRB(5, 18, 5, 18),
      child: Stack(
        children: [
          Column(
            children: [
              const Text("Select a contact from your phone contact\nfor each Gesture ",style: FontConstants.W_MediumFont,textAlign: TextAlign.center,),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/images/logo.png",width: 75,height: 75,),
                            const Text("One Shake",style: FontConstants.W_MediumFont2,),
                            InkWell(onTap:() {Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const GetContactsPage()));
                            // setState(() {
                            //   contactList.id_num = 0;
                            //   newId = 0;
                            // });
                            },
                              child: Container(
                                width: 50,height: 50,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: const Color(0xFF197BBE),),
                                child: const Icon(Icons.add,size: 40,),
                              ),
                            ),
                            Text(contactList.contactName1,style: const TextStyle(fontSize: 16,color: Colors.white),)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/images/logo.png",width: 75,height: 75,),
                            const Text("Two Shakes",style: FontConstants.W_MediumFont2,),
                            InkWell(onTap:() {Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const GetContactsPage1()));
                            // setState(() {
                            //   contactList.id_num = 1;
                            // });
                            },
                              child: Container(
                                width: 50,height: 50,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: const Color(0xFF197BBE),),
                                child: const Icon(Icons.add,size: 40,),
                              ),
                            ),
                            Text(contactList.contactName2,style: const TextStyle(fontSize: 16,color: Colors.white))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/images/logo.png",width: 75,height: 75,),
                            const Text("Three Shakes",style: FontConstants.W_MediumFont2,),
                            InkWell(onTap:() {
                              readContact();
                              setState(() {

                              });
                              // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const GetContactsPage2()));
                            // setState(() {
                            //   contactList.id_num = 2;
                            // });
                            },
                              child: Container(
                                width: 50,height: 50,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: const Color(0xFF197BBE),),
                                child: const Icon(Icons.add,size: 40,),
                              ),
                            ),
                            Text(contactList.contactName3,style: const TextStyle(fontSize: 16,color: Colors.white))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/images/logo.png",width: 75,height: 75,),
                            const Text("Four Shakes",style: FontConstants.W_MediumFont2,),
                            InkWell(onTap:() {Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const GetContactsPage3()));
                            // setState(() {
                            //   contactList.id_num = 3;
                            // });
                            },
                              child: Container(
                                width: 50,height: 50,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: const Color(0xFF197BBE),),
                                child: const Icon(Icons.add,size: 40,),
                              ),
                            ),
                            Text(contactList.contactName4,style: const TextStyle(fontSize: 16,color: Colors.white))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              )
            ],
          )
        ],
      ),
    );
  }
}

// class ModelOfDatabaseContacts {
//
//   int? id;
//   String? name;
//   String? phone;
//
//   ModelOfDatabaseContacts(this.id, this.name, this.phone);
// }
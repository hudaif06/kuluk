
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kuluk/screens/message/presenter.dart';
import 'package:kuluk/util/color_constants.dart';
import 'package:kuluk/util/font_constants.dart';

import '../app_bar_list/list_actions.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final TextEditingController _controller = TextEditingController();
  PresetMessages messages = PresetMessages();

  changeText() {
    setState(() {
      _controller.text = messages.newText;
    });
  }

  clearTextField(){
    _controller.clear();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/bg_image.png",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,fit: BoxFit.cover,),
        Scaffold(resizeToAvoidBottomInset: false,
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

  Widget _body(){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
              color: ColorConstants.primaryColor,
            ),
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(5, 18, 5, 18),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Type or Click on Template",style: FontConstants.W_SmallFont2,),
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            width: double.infinity,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(6)),
                            child: Stack(
                              children: [
                                 TextField(controller: _controller,
                                  decoration:  const InputDecoration.collapsed(hintText: "Type here",hintStyle: TextStyle(color: Colors.grey)),
                                  maxLines: 20,
                                ),
                                // Positioned(right: 0,top: 0,
                                //     child: TextButton(onPressed: (){}, child: const Text("SAVE",style: TextStyle(color: Colors.green),))),
                                Positioned(right: 0,bottom: 0,
                                    child: TextButton(style: TextButton.styleFrom(backgroundColor: const Color(0xFFd6d8d7),primary: Colors.black) ,onPressed: (){
                                      // textMe();
                                      Fluttertoast.showToast(
                                          msg: "Shake your phone to send message",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.TOP,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 20
                                      );
                                      }, child: const Text("SEND"))),
                                Positioned(bottom: 0,right: 80,
                                    child: TextButton(style: TextButton.styleFrom(backgroundColor: const Color(0xFFd6d8d7),primary: Colors.black) ,onPressed: (){clearTextField();}, child: const Text("CLEAR")))
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(6)),
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              child: IntrinsicHeight(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        messages.newText = messages.text1;
                                        changeText();
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        child: Text(messages.text1,style: FontConstants.G_SmallFont,),
                                      ),
                                    ),
                                    const Divider(color: Colors.black,),
                                    InkWell(
                                      onTap: (){
                                        messages.newText = messages.text2;
                                        changeText();
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        child: Text(messages.text2,style: FontConstants.G_SmallFont,),
                                      ),
                                    ),
                                    const Divider(color: Colors.black,),
                                    InkWell(
                                      onTap: (){
                                        messages.newText = messages.text3;
                                        changeText();
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        child: Text(messages.text3,style: FontConstants.G_SmallFont,),
                                      ),
                                    ),
                                    const Divider(color: Colors.black,),InkWell(
                                      onTap: (){
                                        messages.newText = messages.text4;
                                        changeText();
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        child: Text(messages.text4,style: FontConstants.G_SmallFont,),
                                      ),
                                    ),
                                    const Divider(color: Colors.black,),
                                    InkWell(
                                      onTap: (){
                                        messages.newText = messages.text5;
                                        changeText();
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        child: Text(messages.text5,style: FontConstants.G_SmallFont,),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        )
                      ],
                    )
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kuluk_app/util/color_constants.dart';
import 'package:kuluk_app/util/font_constants.dart';
import 'package:shake/shake.dart';

import '../app_bar_list/list_actions.dart';

class CallPage extends StatefulWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  // GetContactsModel? objGetContact;
  // dynamic phoneNo = objGetContact?.contacts;
  int counter = 0;
  static AudioCache player = AudioCache();
  static const alarmAudioPath = "audio/rami.mp3";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(
        shakeCountResetTime: 5000,
        shakeSlopTimeMS: 1000,
        onPhoneShake: () {
          counter++;
          Fluttertoast.showToast(
              msg: "couldn't complete operation",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              // backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 20);
          // launch('tel: $num');
          player.play(alarmAudioPath);
        });
    // detector.stopListening();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        "assets/images/bg_image.png",
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50), child: _appBar()),
        body: _body(),
      ),
    ]);
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "Kuluk",
        style: FontConstants.W_LargeFont,
      ),
      actions: [popUpMenu()],
    );
  }

  Widget popUpMenu() {
    return PopupMenuButton(
      itemBuilder: (context) => [
        const PopupMenuItem(
          child: Text("Help"),
          value: 0,
        ),
        const PopupMenuItem(
          child: Text("About"),
          value: 1,
        ),
        const PopupMenuItem(
          child: Text("Contact Us      "),
          value: 2,
        ),
      ],
      onSelected: (item) => selectedItem(context, item),
    );
  }

  Widget _body() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorConstants.primaryColor,
              ),
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(5, 18, 5, 18),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "  Welcome to Gesture\nbased shake app Kuluk !",
                          style: FontConstants.B_AboveMediumFont,
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        Image.asset("assets/images/logo.png"),
                        const SizedBox(
                          height: 27,
                        ),
                        const Text(
                          "Shake or Tap the phone to call",
                          style: FontConstants.B_AboveMediumFont,
                        ),
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

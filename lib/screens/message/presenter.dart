
import 'package:url_launcher/url_launcher.dart';

class PresetMessages{
  final String text1 = "Help me im stuck";
  final String text2 = "Call me back please !";
  final String text3 = "Busy right now Will call you back";
  final String text4 = "Busy at the moment";
  final String text5 = "Call me Tomorrow";
  String newText = "";
}


textMe() async {
  const url = 'sms:0000?body=hello%20there';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
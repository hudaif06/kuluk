
import 'package:flutter/material.dart';
import 'package:kuluk/util/font_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/bg_image.png",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,fit: BoxFit.cover,),
        Scaffold(backgroundColor: Colors.transparent,
        appBar: PreferredSize(preferredSize: const Size.fromHeight(50),child: _appBar()),
        body: _body(),
      ),]
    );
  }


  Widget _appBar(){
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_outlined,color: Color(0xFFbfc5c6),),
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text("Help",style: FontConstants.W_LargeFont,),
    );
  }

  Widget _body(){
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• Shake To Call",style: FontConstants.W_MediumFont,),
          const SizedBox(height: 8,),
          const Text('''You can add  a number from your phone contact list and set a Gesture against the number.Each corresponding number of Shakes, prompts for a confirmation and makes a call ! To cancel the call, you need to just shake the phone once.''',textAlign: TextAlign.justify,
            style: FontConstants.W_SmallFont,),
          const SizedBox(height: 8,),
          const Text("• Tap To Call",style: FontConstants.W_MediumFont,),
          const SizedBox(height: 8,),
          const Text('''Now you can also Tap on the Phone screen to make a call. The Taps can be customised for each number from the phone list (up to 4 numbers).Each corresponding number of Taps prompts for a confirmation and makes a call ! To cancel the call, you need to place the phone in a Facedown position (see Tip!)''',textAlign: TextAlign.justify,
            style: FontConstants.W_SmallFont,),
          const SizedBox(height: 8,),
          const Text("• Shake to Message",style: FontConstants.W_MediumFont,),
          const SizedBox(height: 8,),
          const Text('''A superior feature of the 'Kuluk' allows users to compose or lead pre-set template messages. You can link a Shake against a number (s) from your phone book. Each corresponding number of shakes, allows the user to send out a message.''',textAlign: TextAlign.justify,
            style: FontConstants.W_SmallFont,),
          const SizedBox(height: 8,),
          const Text("• Tip ! - Facedown to Cancel",style: FontConstants.W_MediumFont,),
          const SizedBox(height: 8,),
          const Text('''Another simple but useful feature is the ability to cancel a call by simply positioning your android device facedown''',textAlign: TextAlign.justify,
            style: FontConstants.W_SmallFont,),
          const SizedBox(height: 24,),
          Container(alignment: Alignment.center,
            child: InkWell(onTap:(){ _launchURL();},
                child: Image.asset("assets/images/userguide.png")),)
        ],
      ),
    );
  }
}


_launchURL() async{
    const url = "http://sightica.com";
    if (await canLaunch(url)) {
      await launch(url,forceWebView: true,enableJavaScript: true);
    } else {
      throw 'Could not launch $url';
    }
}
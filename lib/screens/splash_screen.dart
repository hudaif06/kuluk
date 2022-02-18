import 'package:flutter/material.dart';
import 'package:kuluk_app/screens/navigationPanel.dart';

class SplashScreen extends StatefulWidget {
  // final String contactName;
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // String get contactName => contactName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetofirstpage();
  }

  _navigatetofirstpage() async {
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => NavigationPanelPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/bg_image.png",
              ),
              fit: BoxFit.cover)),
      child: Image.asset(
        "assets/images/logo.png",
      ),
    );
  }
}

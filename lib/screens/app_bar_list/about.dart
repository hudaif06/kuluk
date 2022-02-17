
import 'package:flutter/material.dart';
import 'package:kuluk/util/font_constants.dart';


class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),child: _appBar()),
      body: _body(),
    );
  }

  Widget _appBar(){
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_outlined,color: Color(0xFFbfc5c6),),
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      title: const Text("About Us", style: FontConstants.W_MediumFont),
    );
  }

  Widget _body(){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/bg_image.png",),fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Text("Kuluk",style: FontConstants.W_MediumFont,),
          const SizedBox(height: 8,),
          const Text("Version 1.6", style: FontConstants.W_SmallFont,),
          const SizedBox(height: 10,),
          Image.asset("assets/images/logo.png"),
          const SizedBox(height: 16,),
          const Text("2021 Sightica Inc.\nAll right reserved", style: FontConstants.W_MediumFont,),
        ],
      ),
    );
  }
}

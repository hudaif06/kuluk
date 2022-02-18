import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:kuluk_app/screens/call/page.dart';
import 'package:kuluk_app/screens/contact/page.dart';
import 'package:kuluk_app/screens/message/page.dart';
import 'package:kuluk_app/util/color_constants.dart';

class NavigationPanelPage extends StatefulWidget {
  // final String contactName;
  const NavigationPanelPage({Key? key}) : super(key: key);

  @override
  _NavigationPanelPageState createState() => _NavigationPanelPageState();
}

class _NavigationPanelPageState extends State<NavigationPanelPage> {
  // String get contactName => contactName;
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final _bottomNavigationBarItems = <BottomBarItem>[
    BottomBarItem(
      icon: const Text(
        "CALL   ",
        style: TextStyle(color: Colors.white),
      ),
      title: const Text(''),
      activeColor: Colors.white,
    ),
    BottomBarItem(
      icon: const Text(
        "MESSAGE",
        style: TextStyle(color: Colors.white),
      ),
      title: const Text(''),
      activeColor: Colors.white,
    ),
    BottomBarItem(
      icon: const Text(
        "CONTACT",
        style: TextStyle(color: Colors.white),
      ),
      title: const Text(''),
      activeColor: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        children: [CallPage(), MessagePage(), ContactPage()],
      ),
      bottomNavigationBar: BottomBar(
        showActiveBackgroundColor: true,
        backgroundColor: ColorConstants.backgroundColor,
        selectedIndex: _currentIndex,
        items: _bottomNavigationBarItems,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 100), curve: Curves.ease);
        },
      ),
    );
  }
}

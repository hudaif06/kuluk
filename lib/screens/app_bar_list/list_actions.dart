

import 'package:flutter/material.dart';
import 'about.dart';
import 'contact_us.dart';
import 'help.dart';

void selectedItem(BuildContext context, item) {
  switch (item) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HelpPage()));
      break;
    case 1:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const AboutPage()));
      break;
    case 2:
      sendingMails();
      break;
  }
}

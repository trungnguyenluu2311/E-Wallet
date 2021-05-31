import 'package:e_wallet/screen/landing_page.dart';
import 'package:e_wallet/screen/login_screen.dart';
import 'package:e_wallet/screen/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SafeArea(child: LandingPage(),),
    );
  }
}

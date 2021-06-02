import 'package:e_wallet/screen/add_screen/add_transaction.dart';
import 'package:e_wallet/screen/bottom_nav_screen/home_screen.dart';
import 'package:e_wallet/screen/bottom_nav_screen/more_screen.dart';
import 'package:e_wallet/screen/bottom_nav_screen/planning_screen.dart';
import 'package:e_wallet/screen/bottom_nav_screen/statistics_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedItem = 0;
  final tabs = [
    HomeScreen(),
    PlanningScreen(),
    StatisticScreen(),
    MoreScreen()
  ];
  final appbarTitles = [
    'Home',
    'Planning',
    'Statistics',
    'More',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          shadowColor: Colors.white,
          title: Text(appbarTitles[_selectedItem],
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'RobotoSlab',
                  fontSize: 34,
                  fontWeight: FontWeight.w700)),
        ),
        body: tabs[_selectedItem],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              border: Border(top: BorderSide(width: 0.5, color: Colors.white))),
          child: BottomNavigationBar(
            currentIndex: _selectedItem,
            iconSize: 34,
            selectedItemColor: Color(0xFFF40057),
            unselectedItemColor: Color(0xFF7D7D7D),
            selectedLabelStyle: TextStyle(
                fontFamily: 'RobotoSlab',
                fontWeight: FontWeight.w700,
                fontSize: 14),
            unselectedLabelStyle: TextStyle(
                fontFamily: 'RobotoSlab',
                fontWeight: FontWeight.w700,
                fontSize: 14),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.timer),
                label: 'Planning',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_sharp),
                label: 'Statistics',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz),
                label: 'More',
              ),
            ],
            onTap: (index) {
              setState(() {
                _selectedItem = index;
              });
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddTransaction()));
            },
            child: Icon(Icons.add, size: 50, color: Colors.black),
            backgroundColor: Color(0xFFF40057)
            ),
      ),
    );
  }
}

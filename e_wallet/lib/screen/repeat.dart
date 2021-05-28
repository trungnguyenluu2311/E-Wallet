import 'package:flutter/material.dart';

class Repeat extends StatefulWidget {
  @override
  _RepeatState createState() => _RepeatState();
}

class _RepeatState extends State<Repeat> {
  dynamic _switchVal = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: BackButton(
              color: Color(0xFFCC0047),
            ),
            title: Text(
              'Repeat',
              style: TextStyle(
                  color: Color(0xFFCCCCCC),
                  fontSize: 20,
                  fontFamily: 'RobotoSlab',
                  fontWeight: FontWeight.w700),
            ),
            backgroundColor: Colors.black,
            shadowColor: Colors.white,
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.black),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 24),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Repeat',
                          style: TextStyle(
                              color: Color(0xFFCCCCCC),
                              fontFamily: 'RobotoSlab',
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Switch(
                          value: _switchVal,
                          activeColor: Color(0xFFCC0047),
                          onChanged: (_newVal) {
                            setState(() {
                              _switchVal = _newVal;
                            });
                          }),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  (_switchVal == false)
                      ? 'The payment wont be repeated'
                      : 'The payment will be repeated',
                  style: TextStyle(
                      color: Color(0xFF999999),
                      fontFamily: 'RobotoSlab',
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )
              ]),
            ),
          )),
    );
  }
}

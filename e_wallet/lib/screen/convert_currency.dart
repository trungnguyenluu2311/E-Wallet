import 'package:flutter/material.dart';

class ConvertCurrency extends StatefulWidget {
  @override
  _ConvertCurrencyState createState() => _ConvertCurrencyState();
}

class _ConvertCurrencyState extends State<ConvertCurrency> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              leading: BackButton(color: Color(0xFFCC0047)),
              backgroundColor: Colors.black,
              shadowColor: Colors.white,
              title: Text(
                'Convert Currency',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'RobotoSlab',
                    fontSize: 35,
                    fontWeight: FontWeight.w700),
              )),
          body: Container(
              padding: EdgeInsets.fromLTRB(14, 24, 14, 24),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Colors.black),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                      child: Column(children: [
                        Row(
                          children: [
                            Icon(
                              Icons.flag,
                              size: 34,
                              color: Color(0xFF787878),
                            ),
                            SizedBox(width: 14),
                            RichText(
                                text: TextSpan(
                                    text: 'Viet Nam',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'RobotoSlab',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                    children: [
                                  TextSpan(text: '\n'),
                                  TextSpan(
                                      text: 'VNĐ',
                                      style: TextStyle(
                                          color: Color(0xFFCCCCCC),
                                          fontWeight: FontWeight.w500))
                                ]))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: TextField(
                              style: TextStyle(color: Colors.white),
                            )),
                            Text(
                              'VNĐ',
                              style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ]),
                    ),
                    SizedBox(height: 24),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.all(14),
                              backgroundColor: Color(0xFF1B1C1E),
                              side: BorderSide(color: Color(0xFFF40057))),
                          child: Row(children: [
                            Text('Switch Currency',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'RobotoSlab',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: 12,
                            ),
                            Icon(Icons.swap_vertical_circle,
                                color: Colors.white, size: 26)
                          ])),
                    ]),
                    SizedBox(height: 24),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                      child: Column(children: [
                        Row(
                          children: [
                            Icon(
                              Icons.flag,
                              size: 34,
                              color: Color(0xFF787878),
                            ),
                            SizedBox(width: 14),
                            RichText(
                                text: TextSpan(
                                    text: 'USA',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'RobotoSlab',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                    children: [
                                  TextSpan(text: '\n'),
                                  TextSpan(
                                      text: 'USD',
                                      style: TextStyle(
                                          color: Color(0xFFCCCCCC),
                                          fontWeight: FontWeight.w500))
                                ]))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: TextField(
                              style: TextStyle(color: Colors.white),
                            )),
                            Text(
                              'USD',
                              style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ]),
                    ),
                  ],
                ),
              ))),
    );
  }
}

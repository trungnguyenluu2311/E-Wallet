import 'package:e_wallet/screen/select_time_range.dart';
import 'package:e_wallet/screen/select_wallet.dart';
import 'package:flutter/material.dart';

class StatisticScreen extends StatefulWidget {
  @override
  _StatisticScreenState createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SelectTimeRange()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                child: Row(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectWallet()));
                    },
                    child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            color: Color(0xFF26C5DA)),
                        child: Icon(Icons.money)),
                  ),
                  Expanded(
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            text: 'This month',
                            style: TextStyle(
                                color: Color(0xFFCCCCCC),
                                fontFamily: 'RobotoSlab',
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                            children: [
                              TextSpan(text: '\n'),
                              TextSpan(
                                  text: '01/05/2021 - 31/05/2021',
                                  style: TextStyle(
                                      color: Color(0xFF787878), fontSize: 16))
                            ]),
                      ),
                    ),
                  )
                ]),
              ),
            ),
            SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Openning balance',
                        style: TextStyle(
                            color: Color(0xFF787878),
                            fontFamily: 'RobotoSlab',
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '50.000.000 VNĐ',
                        style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontFamily: 'RobotoSlab',
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Closing balance',
                        style: TextStyle(
                            color: Color(0xFF787878),
                            fontFamily: 'RobotoSlab',
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '10.000.000 VNĐ',
                        style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontFamily: 'RobotoSlab',
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              height: 34,
              color: Color(0xFFCCCCCC),
              thickness: 1,
            ),
            Text(
              'Net Income',
              style: TextStyle(
                  color: Color(0xFFCCCCCC),
                  fontFamily: 'RobotoSlab',
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 16),
            Container(
                height: 50,
                decoration: BoxDecoration(color: Color(0xFF1B1C1E))),
            SizedBox(height: 26),
            Container(
              decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                        child: Column(
                          children: [
                            Text(
                              'Income',
                              style: TextStyle(
                                  color: Color(0xFF787878),
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              '10.000.000 VNĐ',
                              style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 14),
                            CircleAvatar(
                              backgroundColor: Color(0xFF0984FB),
                              radius: 44,
                            )
                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(
                      thickness: 1,
                      color: Color(0xFFCCCCCC),
                    ),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                      child: Column(
                        children: [
                          Text(
                            'Expense',
                            style: TextStyle(
                                color: Color(0xFF787878),
                                fontFamily: 'RobotoSlab',
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '50.000.000 VNĐ',
                            style: TextStyle(
                                color: Color(0xFFCCCCCC),
                                fontFamily: 'RobotoSlab',
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 14),
                          CircleAvatar(
                            backgroundColor: Color(0xFFF40057),
                            radius: 44,
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}

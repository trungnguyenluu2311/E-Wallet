import 'package:e_wallet/screen/add_wallet.dart';
import 'package:e_wallet/screen/edit_wallet.dart';
import 'package:e_wallet/screen/edit_transaction.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(14, 24, 14, 0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditWallet()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Color(0xFF1B1C1E),
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Color(0xFF26C5DA),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Icon(Icons.attach_money),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Wallet name',
                              style: TextStyle(
                                  fontFamily: 'RobotoSlab',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Color(0xFF787878)),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: '+12.000.000',
                                  style: TextStyle(
                                      color: Color(0xFFCCCCCC),
                                      fontFamily: 'RobotoSlab',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                  children: [
                                    TextSpan(text: '\n'),
                                    TextSpan(text: 'VNĐ')
                                  ]),
                            )
                          ]),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Color(0xFF1B1C1E),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Column(children: [
                      FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddWallet()));
                          },
                          child: Icon(Icons.add, size: 50, color: Colors.black),
                          backgroundColor: Color(0xFFF40057)),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Add Wallet',
                        style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      )
                    ]),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text('All transactions',
                style: TextStyle(
                    color: Color(0xFFCCCCCC),
                    fontFamily: 'RobotoSlab',
                    fontSize: 20,
                    fontWeight: FontWeight.w700)),
            SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditTransaction()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Color(0xFF1B1C1E),
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Column(children: [
                  Row(children: [
                    Text('05',
                        style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontSize: 22,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w700)),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text('Thứ 4 tháng 5 năm 2021',
                          style: TextStyle(
                              color: Color(0xFF787878),
                              fontFamily: 'RobotoSlab',
                              fontSize: 16)),
                    ),
                    RichText(
                      text: TextSpan(
                          text: '+10.000.000',
                          style: TextStyle(
                              color: Color(0xFFF40057),
                              fontFamily: 'RobotoSlab',
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                          children: [
                            TextSpan(text: '\n'),
                            TextSpan(text: 'VNĐ')
                          ]),
                    )
                  ]),
                  SizedBox(height: 18),
                  Row(
                    children: [
                      Icon(Icons.monetization_on_outlined,
                          color: Color(0xFFF40057), size: 22),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Withdraw',
                                  style: TextStyle(
                                      color: Color(0xFFCCCCCC),
                                      fontFamily: 'RobotoSlab',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                              Text('Money for children',
                                  style: TextStyle(
                                      color: Color(0xFF787878),
                                      fontFamily: 'RobotoSlab',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: '+10.000.000',
                            style: TextStyle(
                                color: Color(0xFFF40057),
                                fontFamily: 'RobotoSlab',
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                            children: [
                              TextSpan(text: '\n'),
                              TextSpan(text: 'VNĐ')
                            ]),
                      )
                    ],
                  ),
                  SizedBox(height: 18),
                  Row(
                    children: [
                      Icon(Icons.monetization_on_outlined,
                          color: Color(0xFFF40057), size: 22),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Get Paid',
                                  style: TextStyle(
                                      color: Color(0xFFCCCCCC),
                                      fontFamily: 'RobotoSlab',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                              Text('Loan pay',
                                  style: TextStyle(
                                      color: Color(0xFF787878),
                                      fontFamily: 'RobotoSlab',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: '+10.000.000',
                            style: TextStyle(
                                color: Color(0xFFF40057),
                                fontFamily: 'RobotoSlab',
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                            children: [
                              TextSpan(text: '\n'),
                              TextSpan(text: 'VNĐ')
                            ]),
                      )
                    ],
                  )
                ]),
              ),
            )
          ]),
        ));
  }
}

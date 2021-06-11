import 'package:e_wallet/screen/edit_screen/edit_planned_payment.dart';
import 'package:flutter/material.dart';

class DetailPlannedPayment extends StatefulWidget {
  @override
  _DetailPlannedPaymentState createState() => _DetailPlannedPaymentState();
}

class _DetailPlannedPaymentState extends State<DetailPlannedPayment> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: BackButton(color: Color(0xFFCC0047)),
            backgroundColor: Colors.black,
            centerTitle: true,
            shadowColor: Colors.white,
            actions: [
              GestureDetector(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => EditPlannedPayment()));
                },
                child: Icon(Icons.edit, color: Color(0xFFCC0047)))
            ],
            title: Text(
              'Detail planned payment',
              style: TextStyle(
                  color: Color(0xFFCCCCCC),
                  fontFamily: 'RobotoSlab',
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            )),
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.black),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                    child: Text(
                      'Pay rent (name)',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'RobotoSlab',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                    child: Column(children: [
                      Icon(
                        Icons.home,
                        size: 44,
                        color: Color(0xFFF40057),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Pay rent (name)',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Rent',
                        style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontSize: 16,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '-3.000.000 VNĐ',
                        style: TextStyle(
                            color: Color(0xFF990036),
                            fontSize: 16,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w700),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 50, 0, 14),
                    child: Text('PAYMENT OVERVIEW',
                        style: TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 20,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w700)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('17 June 2021',
                              style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontSize: 18,
                                  fontFamily: 'RobotoSlab',
                                  fontWeight: FontWeight.w700)),
                          Row(children: [
                            Icon(
                              Icons.timelapse,
                              size: 20,
                              color: Color(0xFFF40057),
                            ),
                            SizedBox(width: 4),
                            Text('Due date in 31 dates',
                                style: TextStyle(
                                    color: Color(0xFFF40057),
                                    fontSize: 16,
                                    fontFamily: 'RobotoSlab',
                                    fontWeight: FontWeight.w700)),
                          ]),
                          Row(children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                    backgroundColor: Color(0xFFF40057)),
                                child: Text(
                                  'Marked as paid',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'RobotoSlab',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            SizedBox(width: 14),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                    backgroundColor: Color(0xFF1B1C1E),
                                    side: BorderSide(
                                      color: Color(0xFFF40057)
                                    ),
                                    ),
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: Color(0xFFF40057),
                                      fontFamily: 'RobotoSlab',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            )
                          ])
                        ]),
                  ),
                  SizedBox(height: 3),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('17 May 2021',
                              style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontSize: 18,
                                  fontFamily: 'RobotoSlab',
                                  fontWeight: FontWeight.w700)),
                          Row(children: [
                            Icon(
                              Icons.timelapse,
                              size: 20,
                              color: Color(0xFFFB9506),
                            ),
                            SizedBox(width: 4),
                            Text('Due date today',
                                style: TextStyle(
                                    color: Color(0xFFFB9506),
                                    fontSize: 16,
                                    fontFamily: 'RobotoSlab',
                                    fontWeight: FontWeight.w700)),
                          ]),
                          Row(children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                    backgroundColor: Color(0xFFF40057)),
                                child: Text(
                                  'Marked as paid',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'RobotoSlab',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            SizedBox(width: 14),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                    backgroundColor: Color(0xFF1B1C1E),
                                    side: BorderSide(
                                      color: Color(0xFFF40057)
                                    ),
                                    ),
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: Color(0xFFF40057),
                                      fontFamily: 'RobotoSlab',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            )
                          ])
                        ]),
                  ),
                ],
              ),
            )),
        bottomNavigationBar: Container(
            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
            decoration: BoxDecoration(
                color: Color(0xFF1B1C1E),
                border:
                    Border(top: BorderSide(color: Colors.white, width: 0.5))),
            child: OutlinedButton(
                child: Text(
                  'Save',
                  style: TextStyle(
                      color: Color(0xFFCCCCCC),
                      fontFamily: 'RobotoSlab',
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF303030)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.fromLTRB(0, 8, 0, 8)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)))))),
      ),
    );
  }
}

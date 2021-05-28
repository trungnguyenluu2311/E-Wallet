import 'package:e_wallet/screen/add_planned_payment.dart';
import 'package:e_wallet/screen/detail_planned_payment.dart';
import 'package:flutter/material.dart';

class PlannedPayments extends StatefulWidget {
  @override
  _PlannedPaymentsState createState() => _PlannedPaymentsState();
}

class _PlannedPaymentsState extends State<PlannedPayments> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Color(0xFFCC0047),
          ),
          title: Text(
            'Planned Payments',
            style: TextStyle(
                color: Colors.white,
                fontSize: 34,
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
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Color(0xFFCCCCCC)))),
                padding: const EdgeInsets.fromLTRB(14, 24, 14, 24),
                child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 12),
                      labelStyle: TextStyle(
                          color: Color(0xFF787878),
                          fontSize: 20,
                          fontFamily: 'RobotoSlab',
                          fontWeight: FontWeight.w700),
                      labelText: 'Search',
                      filled: true,
                      fillColor: Color(0xFF1B1C1E),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 34,
                        color: Color(0xFF787878),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    )),
              ),
              SizedBox(height: 24),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPlannedPayment()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Color(0xFF1B1C1E),
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: Column(children: [
                        Row(
                          children: [
                            Icon(Icons.home,
                                color: Color(0xFFF40057), size: 28),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Pay rent (name planned payments)',
                                        style: TextStyle(
                                            color: Color(0xFFCCCCCC),
                                            fontFamily: 'RobotoSlab',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                    Text('Rent (category)',
                                        style: TextStyle(
                                            color: Color(0xFFCCCCCC),
                                            fontFamily: 'RobotoSlab',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                    Text('Every month following date: 17th',
                                        style: TextStyle(
                                            color: Color(0xFF787878),
                                            fontFamily: 'RobotoSlab',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                  ]),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: '-3.000.000',
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
                      ]),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddPlannedPayment()));
            },
            child: Icon(Icons.add, size: 36, color: Colors.black),
            backgroundColor: Color(0xFFF40057)),
      ),
    );
  }
}

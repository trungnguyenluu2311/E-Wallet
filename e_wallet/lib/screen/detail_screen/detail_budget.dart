import 'package:e_wallet/screen/edit_screen/edit_budget.dart';
import 'package:flutter/material.dart';

class DetailBudget extends StatefulWidget {
  @override
  _DetailBudgetState createState() => _DetailBudgetState();
}

class _DetailBudgetState extends State<DetailBudget> {
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditBudget()));
                  },
                  child: Icon(Icons.edit, color: Color(0xFFCC0047)))
            ],
            title: Text(
              'Detail budget',
              style: TextStyle(
                  color: Color(0xFFCCCCCC),
                  fontFamily: 'RobotoSlab',
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            )),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.black),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                    child: Text(
                      'Budget (name)',
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
                        Icons.restaurant,
                        size: 44,
                        color: Color(0xFFF40057),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Budget name',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Food & drink',
                        style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontSize: 16,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '5.000.000 VNĐ',
                        style: TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 16,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w700),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 50, 0, 14),
                    child: Text('Transaction under budget',
                        style: TextStyle(
                            color: Colors.white,
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
                          SizedBox(height: 18),
                          Row(
                            children: [
                              Icon(Icons.local_drink,
                                  color: Color(0xFFF40057), size: 22),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Buy milk tea',
                                          style: TextStyle(
                                              color: Color(0xFFCCCCCC),
                                              fontFamily: 'RobotoSlab',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)),
                                      Text('Buy milk tea for my mother',
                                          style: TextStyle(
                                              color: Color(0xFF787878),
                                              fontFamily: 'RobotoSlab',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)),
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: '-2.000.000',
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
                              Icon(Icons.rice_bowl,
                                  color: Color(0xFFF40057), size: 22),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Buy rice',
                                          style: TextStyle(
                                              color: Color(0xFFCCCCCC),
                                              fontFamily: 'RobotoSlab',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)),
                                      Text('Buy rice for ...',
                                          style: TextStyle(
                                              color: Color(0xFF787878),
                                              fontFamily: 'RobotoSlab',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)),
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: '-500.000',
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
                  SizedBox(height: 3),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('18 June 2021',
                              style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontSize: 18,
                                  fontFamily: 'RobotoSlab',
                                  fontWeight: FontWeight.w700)),
                          SizedBox(height: 18),
                          Row(
                            children: [
                              Icon(Icons.local_drink,
                                  color: Color(0xFFF40057), size: 22),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Buy milk tea',
                                          style: TextStyle(
                                              color: Color(0xFFCCCCCC),
                                              fontFamily: 'RobotoSlab',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)),
                                      Text('Buy milk tea for my mother',
                                          style: TextStyle(
                                              color: Color(0xFF787878),
                                              fontFamily: 'RobotoSlab',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)),
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: '-2.000.000',
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
                              Icon(Icons.rice_bowl,
                                  color: Color(0xFFF40057), size: 22),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Buy rice',
                                          style: TextStyle(
                                              color: Color(0xFFCCCCCC),
                                              fontFamily: 'RobotoSlab',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)),
                                      Text('Buy rice for ...',
                                          style: TextStyle(
                                              color: Color(0xFF787878),
                                              fontFamily: 'RobotoSlab',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)),
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: '-500.000',
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
                  SizedBox(
                    height: 14,
                  )
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

import 'package:e_wallet/screen/add_screen/add_budget.dart';
import 'package:e_wallet/screen/detail_screen/detail_budget.dart';
import 'package:flutter/material.dart';

class Budgets extends StatefulWidget {
  @override
  _BudgetsState createState() => _BudgetsState();
}

class _BudgetsState extends State<Budgets> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Color(0xFFCC0047),
          ),
          title: Text(
            'Budgets',
            style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontFamily: 'RobotoSlab',
                fontWeight: FontWeight.w700),
          ),
          backgroundColor: Colors.black,
          shadowColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.black),
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
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailBudget()));
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Color(0xFF1B1C1E),
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Column(children: [
                      Row(
                        children: [
                          Icon(Icons.train, color: Color(0xFFF40057), size: 28),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Money to go to market (budget name)',
                                      style: TextStyle(
                                          color: Color(0xFFCCCCCC),
                                          fontFamily: 'RobotoSlab',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                  Text('Food & drink (category)',
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
                                text: '2.000.000',
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
            ]),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddBudget()));
            },
            child: Icon(Icons.add, size: 36, color: Colors.black),
            backgroundColor: Color(0xFFF40057)),
      ),
    );
  }
}

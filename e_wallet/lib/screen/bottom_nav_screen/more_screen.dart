import 'package:e_wallet/screen/category.dart';
import 'package:e_wallet/screen/convert_currency.dart';
import 'package:e_wallet/screen/listwallet.dart';
import 'package:e_wallet/screen/profile.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Column(children: [
          Row(children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
                child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Color(0xFF1B1C1E),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Column(children: [
                    Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Color(0xFF1BD5C7),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Icon(Icons.person, size: 50)),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Color(0xFFCCCCCC),
                        fontFamily: 'RobotoSlab',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ]),
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
                child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Listwallet()));
              },
              child: Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Color(0xFF1B1C1E),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Column(children: [
                  Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Color(0xFFF40057),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Icon(Icons.account_balance_wallet_outlined, size: 50)),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Wallets',
                    style: TextStyle(
                      color: Color(0xFFCCCCCC),
                      fontFamily: 'RobotoSlab',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ]),
              ),
            ))
          ]),
          SizedBox(height: 12),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Category()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Color(0xFF1B1C1E),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Column(children: [
                      Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Color(0xFF0984FB),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Icon(Icons.category_outlined, size: 50,)),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Category',
                        style: TextStyle(
                          color: Color(0xFFCCCCCC),
                          fontFamily: 'RobotoSlab',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ]),
                  ),
                )),
            SizedBox(width: 12),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConvertCurrency()));
                },
                child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Color(0xFF1B1C1E),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Color(0xFFFD9502),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Icon(Icons.multiple_stop, size: 50)),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Currency conversion',
                          style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontFamily: 'RobotoSlab',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ]),
        ]));
  }
}

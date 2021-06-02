import 'package:e_wallet/screen/select_screen/repeat.dart';
import 'package:e_wallet/screen/select_screen/select_category.dart';
import 'package:e_wallet/screen/select_screen/select_wallet.dart';
import 'package:flutter/material.dart';

class AddBudget extends StatefulWidget {
  @override
  _AddBudgetState createState() => _AddBudgetState();
}

class _AddBudgetState extends State<AddBudget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: BackButton(color: Color(0xFFCC0047)),
            backgroundColor: Colors.black,
            centerTitle: true,
            shadowColor: Colors.white,
            title: Text(
              'Add budget',
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
                  SizedBox(height: 3),
                  TextField(
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 26, 0, 26),
                        filled: true,
                        fillColor: Color(0xFF1B1C1E),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              color: Color(0xFF8D8E90),
                            ),
                            child: Text(
                              'VNĐ',
                              style: TextStyle(
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(14, 14, 0, 14),
                    child: Text(
                      'General',
                      style: TextStyle(
                          color: Color(0xFFCCCCCC),
                          fontFamily: 'RobotoSlab',
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  TextField(
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                        labelStyle: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontSize: 20,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w700),
                        labelText: 'Wallet name',
                        filled: true,
                        fillColor: Color(0xFF1B1C1E),
                        prefixIcon: Icon(
                          Icons.person,
                          size: 26,
                          color: Color(0xFF8D8E90),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                      )),
                  SizedBox(height: 2),
                  Container(
                    padding: EdgeInsets.fromLTRB(14, 14, 14, 14),
                    decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.wallet_membership,
                          size: 26,
                          color: Color(0xFF8D8E90),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text('Wallet',
                              style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontSize: 20,
                                  fontFamily: 'RobotoSlab',
                                  fontWeight: FontWeight.w700)),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SelectWallet()));
                            },
                            child: Icon(Icons.arrow_forward_ios,
                                color: Color(0xFF8D8E90), size: 26))
                      ],
                    ),
                  ),
                  SizedBox(height: 3),
                  Container(
                    padding: EdgeInsets.fromLTRB(14, 14, 14, 14),
                    decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.help,
                          size: 26,
                          color: Color(0xFF8D8E90),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text('Category',
                              style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontSize: 20,
                                  fontFamily: 'RobotoSlab',
                                  fontWeight: FontWeight.w700)),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SelectCategory()));
                            },
                            child: Icon(Icons.arrow_forward_ios,
                                color: Color(0xFF8D8E90), size: 26))
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(14, 14, 0, 14),
                      child: Text(
                        'Date and repeat',
                        style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontFamily: 'RobotoSlab',
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )),
                  Container(
                    padding: EdgeInsets.fromLTRB(14, 14, 14, 14),
                    decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          size: 26,
                          color: Color(0xFF8D8E90),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text('Date',
                              style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontSize: 20,
                                  fontFamily: 'RobotoSlab',
                                  fontWeight: FontWeight.w700)),
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.arrow_forward_ios,
                                color: Color(0xFF8D8E90), size: 26))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(14, 14, 14, 14),
                    decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.repeat,
                          size: 26,
                          color: Color(0xFF8D8E90),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text('Repeat',
                              style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontSize: 20,
                                  fontFamily: 'RobotoSlab',
                                  fontWeight: FontWeight.w700)),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Repeat()));
                            },
                            child: Icon(Icons.arrow_forward_ios,
                                color: Color(0xFF8D8E90), size: 26))
                      ],
                    ),
                  ),
                  SizedBox(height: 14),
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

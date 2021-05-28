import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  dynamic _selectedType = 0;

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
              'Add transaction',
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
                  SizedBox(height: 12),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedType = 0;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(40, 6, 40, 6),
                        decoration: BoxDecoration(
                            color: Color(0xFF1B1C1E),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                                color: (_selectedType == 0)
                                    ? Color(0xFFF40057)
                                    : Colors.black)),
                        child: Text(
                          'Expense',
                          style: TextStyle(
                              color: (_selectedType == 0)
                                  ? Color(0xFFF40057)
                                  : Color(0xFFE6E6E6),
                              fontFamily: 'RobotoSlab',
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedType = 1;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(40, 6, 40, 6),
                        decoration: BoxDecoration(
                            color: Color(0xFF1B1C1E),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                                color: (_selectedType == 1)
                                    ? Color(0xFFF40057)
                                    : Colors.black)),
                        child: Text(
                          'Income',
                          style: TextStyle(
                              color: (_selectedType == 1)
                                  ? Color(0xFFF40057)
                                  : Color(0xFFE6E6E6),
                              fontFamily: 'RobotoSlab',
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 12,
                  ),
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
                              borderRadius: BorderRadius.all(Radius.circular(14)),
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
                  TextField(
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                        labelStyle: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontSize: 20,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w700),
                        labelText: 'Category',
                        filled: true,
                        fillColor: Color(0xFF1B1C1E),
                        prefixIcon: Icon(
                          Icons.help,
                          size: 26,
                          color: Color(0xFF8D8E90),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                      )),
                  SizedBox(
                    height: 2,
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
                        labelText: 'Date',
                        filled: true,
                        fillColor: Color(0xFF1B1C1E),
                        prefixIcon: Icon(
                          Icons.date_range,
                          size: 26,
                          color: Color(0xFF8D8E90),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(14, 14, 0, 14),
                      child: Text(
                        'More detail',
                        style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontFamily: 'RobotoSlab',
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )),
                  TextField(
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                        labelStyle: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontSize: 20,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w700),
                        labelText: 'Note',
                        filled: true,
                        fillColor: Color(0xFF1B1C1E),
                        prefixIcon: Icon(
                          Icons.note,
                          size: 26,
                          color: Color(0xFF8D8E90),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                      )),
                  SizedBox(height: 2),
                  TextField(
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                        labelStyle: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontSize: 20,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w700),
                        labelText: 'Photo',
                        filled: true,
                        fillColor: Color(0xFF1B1C1E),
                        prefixIcon: Icon(
                          Icons.photo,
                          size: 26,
                          color: Color(0xFF8D8E90),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                      )),
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

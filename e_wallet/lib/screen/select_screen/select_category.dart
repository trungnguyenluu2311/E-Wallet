import 'package:flutter/material.dart';

class SelectCategory extends StatefulWidget {
  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  dynamic _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: Color(0xFFCC0047),
            ),
            title: Text(
              'Select Category',
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 24, 14, 0),
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
                    setState(() {
                      _selectedItem = 0;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.restaurant,
                          size: 30,
                          color: Color(0xFFF40057),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Text(
                            'Food & drink',
                            style: TextStyle(
                                color: Color(0xFFCCCCCC),
                                fontFamily: 'RobotoSlab',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Icon(Icons.check,
                            color: (_selectedItem == 0)
                                ? Color(0xFFCC0047)
                                : Color(0xFF1B1C1E))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedItem = 1;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          size: 30,
                          color: Color(0xFFF40057),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Text(
                            'Shopping',
                            style: TextStyle(
                                color: Color(0xFFCCCCCC),
                                fontFamily: 'RobotoSlab',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Icon(Icons.check,
                            color: (_selectedItem == 1)
                                ? Color(0xFFCC0047)
                                : Color(0xFF1B1C1E))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedItem = 2;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.house,
                          size: 30,
                          color: Color(0xFFF40057),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Text(
                            'Housing',
                            style: TextStyle(
                                color: Color(0xFFCCCCCC),
                                fontFamily: 'RobotoSlab',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Icon(Icons.check,
                            color: (_selectedItem == 2)
                                ? Color(0xFFCC0047)
                                : Color(0xFF1B1C1E))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedItem = 3;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.train,
                          size: 30,
                          color: Color(0xFFF40057),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Text(
                            'Transportation',
                            style: TextStyle(
                                color: Color(0xFFCCCCCC),
                                fontFamily: 'RobotoSlab',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Icon(Icons.check,
                            color: (_selectedItem == 3)
                                ? Color(0xFFCC0047)
                                : Color(0xFF1B1C1E))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 3),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedItem = 4;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.movie,
                          size: 30,
                          color: Color(0xFFF40057),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Text(
                            'Lift & Entertainment',
                            style: TextStyle(
                                color: Color(0xFFCCCCCC),
                                fontFamily: 'RobotoSlab',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Icon(Icons.check,
                            color: (_selectedItem == 4)
                                ? Color(0xFFCC0047)
                                : Color(0xFF1B1C1E))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 3),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedItem = 5;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.money,
                          size: 30,
                          color: Color(0xFFF40057),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Text(
                            'Income',
                            style: TextStyle(
                                color: Color(0xFFCCCCCC),
                                fontFamily: 'RobotoSlab',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Icon(Icons.check,
                            color: (_selectedItem == 5)
                                ? Color(0xFFCC0047)
                                : Color(0xFF1B1C1E))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 3),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedItem = 6;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.more_horiz,
                          size: 30,
                          color: Color(0xFFF40057),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Text(
                            'More',
                            style: TextStyle(
                                color: Color(0xFFCCCCCC),
                                fontFamily: 'RobotoSlab',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Icon(Icons.check,
                            color: (_selectedItem == 6)
                                ? Color(0xFFCC0047)
                                : Color(0xFF1B1C1E))
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          )),
    );
  }
}
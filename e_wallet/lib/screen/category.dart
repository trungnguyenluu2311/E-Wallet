import 'package:e_wallet/screen/add_category.dart';
import 'package:e_wallet/screen/detail_category.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Color(0xFFCC0047),
          ),
          title: Text(
            'Category',
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
              Container(
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
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailCategory()));
                        },
                        child: Icon(Icons.arrow_forward_ios,
                            color: Color(0xFF787878)))
                  ],
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
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
                    GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.arrow_forward_ios,
                            color: Color(0xFF787878)))
                  ],
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
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
                    GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.arrow_forward_ios,
                            color: Color(0xFF787878)))
                  ],
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
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
                    GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.arrow_forward_ios,
                            color: Color(0xFF787878)))
                  ],
                ),
              ),
              SizedBox(height: 3),
              Container(
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
                    GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.arrow_forward_ios,
                            color: Color(0xFF787878)))
                  ],
                ),
              ),
              SizedBox(height: 3),
              Container(
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
                    GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.arrow_forward_ios,
                            color: Color(0xFF787878)))
                  ],
                ),
              ),
              SizedBox(height: 3),
              Container(
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
                    GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.arrow_forward_ios,
                            color: Color(0xFF787878)))
                  ],
                ),
              ),
            ]),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddCategory()));
            },
            child: Icon(Icons.add, size: 50, color: Colors.black),
            backgroundColor: Color(0xFFF40057)),
      ),
    );
  }
}

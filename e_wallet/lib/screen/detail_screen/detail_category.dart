import 'package:e_wallet/screen/edit_screen/edit_category.dart';
import 'package:flutter/material.dart';

class DetailCategory extends StatefulWidget {
  @override
  _DetailCategoryState createState() => _DetailCategoryState();
}

class _DetailCategoryState extends State<DetailCategory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              actions: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditCategory()));
                    },
                    child: Icon(
                      Icons.edit,
                      color: Color(0xFFCC0047),
                    ))
              ],
              leading: BackButton(color: Color(0xFFCC0047)),
              backgroundColor: Colors.black,
              centerTitle: true,
              shadowColor: Colors.white,
              title: Text(
                'Detail category',
                style: TextStyle(
                    color: Color(0xFFCCCCCC),
                    fontFamily: 'RobotoSlab',
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              )),
          body: Container(
              padding: EdgeInsets.fromLTRB(0, 24, 0, 24),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Colors.black),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(14),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                      child: Column(children: [
                        Icon(
                          Icons.restaurant,
                          size: 40,
                          color: Color(0xFFF40057),
                        ),
                        Text(
                          'Food & drink',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'RobotoSlab',
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 24, 0, 24),
                      child: Text(
                        'Detail category',
                        style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontFamily: 'RobotoSlab',
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.category,
                              size: 26,
                              color: Color(0xFF787878),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Text(
                              'Category name',
                              style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )),
                    SizedBox(height: 3),
                    Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.note,
                              size: 26,
                              color: Color(0xFF787878),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Text(
                              'Notes',
                              style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 58,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete,
                                size: 26,
                                color: Color(0xFFF40057),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Text(
                                'Delete',
                                style: TextStyle(
                                    color: Color(0xFFF40057),
                                    fontFamily: 'RobotoSlab',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ))),
    );
  }
}

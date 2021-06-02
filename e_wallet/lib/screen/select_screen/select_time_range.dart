import 'package:flutter/material.dart';

class SelectTimeRange extends StatefulWidget {
  @override
  _SelectTimeRangeState createState() => _SelectTimeRangeState();
}

class _SelectTimeRangeState extends State<SelectTimeRange> {
  dynamic _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: BackButton(
              color: Color(0xFFCC0047),
            ),
            title: Text(
              'Select Time Range',
              style: TextStyle(
                  color: Color(0xFFCCCCCC),
                  fontSize: 20,
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
                        Expanded(
                            child: RichText(
                                text: TextSpan(
                                    text: 'This month',
                                    style: TextStyle(
                                        color: Color(0xFFCCCCCC),
                                        fontFamily: 'RobotoSlab',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                    children: [
                              TextSpan(text: '\n'),
                              TextSpan(
                                text: '01/05/2021 - 31/05/2021',
                                style: TextStyle(
                                    color: Color(0xFF787878),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              )
                            ]))),
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
                        Expanded(
                            child: RichText(
                                text: TextSpan(
                                    text: 'Last month',
                                    style: TextStyle(
                                        color: Color(0xFFCCCCCC),
                                        fontFamily: 'RobotoSlab',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                    children: [
                              TextSpan(text: '\n'),
                              TextSpan(
                                text: '01/04/2021 - 30/04/2021',
                                style: TextStyle(
                                    color: Color(0xFF787878),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              )
                            ]))),
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
                        Expanded(
                            child: RichText(
                                text: TextSpan(
                                    text: 'Last 3 month',
                                    style: TextStyle(
                                        color: Color(0xFFCCCCCC),
                                        fontFamily: 'RobotoSlab',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                    children: [
                              TextSpan(text: '\n'),
                              TextSpan(
                                text: '01/03/2021 - 31/05/2021',
                                style: TextStyle(
                                    color: Color(0xFF787878),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              )
                            ]))),
                        Icon(Icons.check,
                            color: (_selectedItem == 2)
                                ? Color(0xFFCC0047)
                                : Color(0xFF1B1C1E))
                      ],
                    ),
                  ),
                )
              ]),
            ),
          )),
    );
  }
}

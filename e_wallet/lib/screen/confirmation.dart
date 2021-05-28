import 'package:flutter/material.dart';

class Confirmation extends StatefulWidget {
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
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
              'Confirmation',
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
                          child: Text(
                            'Manual',
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
                SizedBox(height: 4),
                Text(
                  'Upcoming payment will wait for your approvement',
                  style: TextStyle(
                      color: Color(0xFF999999),
                      fontFamily: 'RobotoSlab',
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 24,
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
                          child: Text(
                            'Automatically',
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
                SizedBox(height: 4),
                Text(
                  'The payment will be created without your approvement',
                  style: TextStyle(
                      color: Color(0xFF999999),
                      fontFamily: 'RobotoSlab',
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )
              ]),
            ),
          )),
    );
  }
}

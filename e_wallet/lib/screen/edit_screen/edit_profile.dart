import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Color(0xFFCC0047),
          ),
          title: Text(
            'Edit Profile',
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
              Container(
                  padding: EdgeInsets.fromLTRB(14, 14, 0, 14),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            child: Icon(
                              Icons.person,
                              size: 40,
                            ),
                          ),
                          TextButton(
                              onPressed: () {}, child: Text('Edit photo'))
                        ],
                      ),
                      SizedBox(width: 40),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'First name',
                              style: TextStyle(
                                  color: Color(0xFF787878),
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            TextField(
                              style: TextStyle(color: Colors.white),
                            ),
                            Divider(color: Color(0xFFCCCCCC), height: 14),
                            Text(
                              'Last name',
                              style: TextStyle(
                                  color: Color(0xFF787878),
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            TextField(
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              SizedBox(height: 56),
              TextField(
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                    labelStyle: TextStyle(
                        color: Color(0xFFCCCCCC),
                        fontSize: 20,
                        fontFamily: 'RobotoSlab',
                        fontWeight: FontWeight.w700),
                    labelText: 'Email',
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
              SizedBox(
                height: 3,
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
                    labelText: 'Password',
                    filled: true,
                    fillColor: Color(0xFF1B1C1E),
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 26,
                      color: Color(0xFF8D8E90),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                  )),
              SizedBox(
                height: 56,
              ),
            ]),
          ),
        ),
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

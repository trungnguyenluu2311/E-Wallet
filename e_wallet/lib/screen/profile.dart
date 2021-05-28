import 'package:e_wallet/screen/edit_profile.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
                child: Icon(
                  Icons.edit,
                  color: Color(0xFFCC0047),
                ))
          ],
          leading: BackButton(
            color: Color(0xFFCC0047),
          ),
          title: Text(
            'Profile',
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
                            Text(
                              'Pháp',
                              style: TextStyle(
                                  color: Color(0xFFE6E6E6),
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
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
                            Text(
                              'Huỳnh',
                              style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              SizedBox(height: 56),
              Container(
                padding: EdgeInsets.all(14),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Email',
                        style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontFamily: 'RobotoSlab',
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      'longhappy@gmail.com',
                      style: TextStyle(
                          color: Color(0xFF787878),
                          fontFamily: 'RobotoSlab',
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF787878),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                padding: EdgeInsets.all(14),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Password',
                        style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontFamily: 'RobotoSlab',
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      '*************',
                      style: TextStyle(
                          color: Color(0xFF787878),
                          fontFamily: 'RobotoSlab',
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF787878),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 56,
              ),
              Container(
                padding: EdgeInsets.all(14),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Color(0xFFF40057),
                      size: 34,
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Text(
                      'Logout',
                      style: TextStyle(
                          color: Color(0xFFF40057),
                          fontFamily: 'RobotoSlab',
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

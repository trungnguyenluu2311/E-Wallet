import 'package:e_wallet/screen/edit_screen/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_wallet/models/user_model.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Future<void> _alterDialogBuilder(String title,String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Container(
              child: Text(error),
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close Dialog"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          final UserModel user = UserModel.fromDocumentSnapshot(documentSnapshot: snapshot.data!);
            return Scaffold(
              appBar: AppBar(
                actions: [
                  GestureDetector(
                      onTap: () {
                        // _alterDialogBuilder("Notification", "You don't need to write password if you don't need change");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile(user.name)));
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
                                    'Name',
                                    style: TextStyle(
                                        color: Color(0xFF787878),
                                        fontFamily: 'RobotoSlab',
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "${user.name}",
                                    style: TextStyle(
                                        color: Color(0xFFE6E6E6),
                                        fontFamily: 'RobotoSlab',
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    SizedBox(height: 5),
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
                            "${user.email}",
                            style: TextStyle(
                                color: Color(0xFF787878),
                                fontFamily: 'RobotoSlab',
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
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
                          GestureDetector(
                            onTap: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                  color: Color(0xFFF40057),
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            );
        }
      )
    );
  }
}

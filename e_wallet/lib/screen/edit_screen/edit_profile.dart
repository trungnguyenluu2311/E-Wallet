import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EditProfile extends StatefulWidget {
  final String name;
  EditProfile(this.name);
  @override
  _EditProfileState createState() => _EditProfileState(name);
}

class _EditProfileState extends State<EditProfile> {
  final String name;
  _EditProfileState(this.name);
  final TextEditingController _nameInputCtrl = TextEditingController();
  final TextEditingController _oldpassInputCtrl = TextEditingController();
  final TextEditingController _newpassInputCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameInputCtrl.text = name;
  }

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

  void handleFormSubmit() async {
    if (_oldpassInputCtrl.text.isNotEmpty && _newpassInputCtrl.text.isNotEmpty) {
      User currentUser = FirebaseAuth.instance.currentUser;
      UserCredential? _authResult;
      try {
        _authResult = await currentUser.reauthenticateWithCredential(
          EmailAuthProvider.credential(
              email: currentUser.email,
              password: _oldpassInputCtrl.text),
        );
      } catch(e){
        _alterDialogBuilder("Error",e.toString());
      }
      if(_authResult != null && _authResult.user != null){
        FirebaseAuth.instance.currentUser.updatePassword(_newpassInputCtrl.text).then((_) async {
          DocumentReference docRef = FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid);
          await docRef.update({
            "name": _nameInputCtrl.text,
          });
          Navigator.pop(context);
          _alterDialogBuilder("Notification","Change Info User Success");
        }).catchError((e){
          _alterDialogBuilder("Error",e.toString());
        });
      }
    }
    else if(_oldpassInputCtrl.text.isNotEmpty && _newpassInputCtrl.text.isEmpty){
      _alterDialogBuilder("Error","New password was missing");
    }
    else if(_oldpassInputCtrl.text.isEmpty && _newpassInputCtrl.text.isNotEmpty){
      _alterDialogBuilder("Error","Old password was missing");
    }
    else{
      DocumentReference docRef = FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid);
      await docRef.update({
        "name": _nameInputCtrl.text,
      });
      Navigator.pop(context);
      _alterDialogBuilder("Notification","Change Info User Success");
    }
  }

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
          actions: [
            GestureDetector(
                onTap: () {
                  _alterDialogBuilder("Notification", "You don't need to write password if you don't need change");
                },
                child: Icon(
                  Icons.help,
                  color: Color(0xFFCC0047),
                ))
          ],
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
                          // TextButton(
                          //     onPressed: () {}, child: Text('Edit photo'))
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
                            TextField(
                              controller: _nameInputCtrl,
                              style: TextStyle(fontSize: 30,color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              SizedBox(height: 5),
              TextField(
                controller: _oldpassInputCtrl,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                    labelStyle: TextStyle(
                        color: Color(0xFFCCCCCC),
                        fontSize: 20,
                        fontFamily: 'RobotoSlab',
                        fontWeight: FontWeight.w700),
                    labelText: 'Old Password',
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
                height: 3,
              ),
              TextField(
                controller: _newpassInputCtrl,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                    labelStyle: TextStyle(
                        color: Color(0xFFCCCCCC),
                        fontSize: 20,
                        fontFamily: 'RobotoSlab',
                        fontWeight: FontWeight.w700),
                    labelText: 'New Password',
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
                onPressed: () {handleFormSubmit();},
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

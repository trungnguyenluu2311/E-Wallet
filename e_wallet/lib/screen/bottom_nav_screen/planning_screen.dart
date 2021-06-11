import 'package:e_wallet/screen/budgets.dart';
import 'package:e_wallet/screen/planned_payments.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_wallet/models/wallet_model.dart';
import 'package:e_wallet/models/user_model.dart';

class PlanningScreen extends StatefulWidget {
  @override
  _PlanningScreenState createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State<PlanningScreen> {

  Future<void> _alterDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
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
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        final UserModel user = UserModel.fromDocumentSnapshot(documentSnapshot: snapshot.data);
        if(user.idwallet =="nonewallet"){
          return  Container(
            padding: EdgeInsets.fromLTRB(14, 24, 14, 0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: Column(children: [
              GestureDetector(
                onTap: () {
                  _alterDialogBuilder("You don't have any wallet");
                },
                child: Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      color: Color(0xFF1B1C1E),
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Planned Payments',
                                  style: TextStyle(
                                      color: Color(0xFFCCCCCC),
                                      fontFamily: 'RobotoSlab',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 12,
                              ),
                              Text('Your future payments',
                                  style: TextStyle(
                                      color: Color(0xFF787878),
                                      fontFamily: 'RobotoSlab',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500))
                            ]),
                      ),
                      Icon(
                        Icons.calendar_today,
                        size: 42,
                        color: Colors.yellow[900],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: (){
                  _alterDialogBuilder("You don't have any wallet");
                },
                child: Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      color: Color(0xFF1B1C1E),
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Budgets',
                                  style: TextStyle(
                                      color: Color(0xFFCCCCCC),
                                      fontFamily: 'RobotoSlab',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 12,
                              ),
                              Text('Your spending plan',
                                  style: TextStyle(
                                      color: Color(0xFF787878),
                                      fontFamily: 'RobotoSlab',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500))
                            ]),
                      ),
                      Icon(
                        Icons.money,
                        size: 42,
                        color: Colors.blue[600],
                      )
                    ],
                  ),
                ),
              )
            ]));
        }
        else{
          return  Container(
              padding: EdgeInsets.fromLTRB(14, 24, 14, 0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black,
              child: Column(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PlannedPayments(user.idwallet)));
                  },
                  child: Container(
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        color: Color(0xFF1B1C1E),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Planned Payments',
                                    style: TextStyle(
                                        color: Color(0xFFCCCCCC),
                                        fontFamily: 'RobotoSlab',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: 12,
                                ),
                                Text('Your future payments',
                                    style: TextStyle(
                                        color: Color(0xFF787878),
                                        fontFamily: 'RobotoSlab',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500))
                              ]),
                        ),
                        Icon(
                          Icons.calendar_today,
                          size: 42,
                          color: Colors.yellow[900],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Budgets(user.idwallet)));
                  },
                  child: Container(
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        color: Color(0xFF1B1C1E),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Budgets',
                                    style: TextStyle(
                                        color: Color(0xFFCCCCCC),
                                        fontFamily: 'RobotoSlab',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: 12,
                                ),
                                Text('Your spending plan',
                                    style: TextStyle(
                                        color: Color(0xFF787878),
                                        fontFamily: 'RobotoSlab',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500))
                              ]),
                        ),
                        Icon(
                          Icons.money,
                          size: 42,
                          color: Colors.blue[600],
                        )
                      ],
                    ),
                  ),
                )
              ]));
        }
      }
    );
  }
}

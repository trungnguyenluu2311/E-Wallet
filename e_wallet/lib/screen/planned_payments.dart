import 'package:e_wallet/models/planned_model.dart';
import 'package:e_wallet/models/wallet_model.dart';
import 'package:e_wallet/screen/add_screen/add_planned_payment.dart';
import 'package:e_wallet/screen/detail_screen/detail_planned_payment.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

import 'package:e_wallet/screen/edit_screen/edit_planned_payment.dart';

class PlannedPayments extends StatefulWidget {
  final idwallet;
  PlannedPayments(this.idwallet);
  @override
  _PlannedPaymentsState createState() => _PlannedPaymentsState(idwallet);
}

class _PlannedPaymentsState extends State<PlannedPayments> {
  final formatter = new NumberFormat("#,###");
  final idwallet;
  _PlannedPaymentsState(this.idwallet);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: BackButton(
            color: Color(0xFFCC0047),
          ),
          title: Text(
            'Planned Payments',
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
          color: Colors.black,
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(idwallet).collection("plannedtransactions").orderBy("datespend",descending: true).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                QuerySnapshot query = snapshot.data;
                if(query.size == 0){
                  return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("You don't have any planned transaction yet",style: TextStyle(
                            color: Colors.white,
                          ),),
                        ],
                      )
                  );
                }
                else{
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: query.size,
                      itemBuilder: (context, index) {
                        final item = query.docs[index];
                        final PlannedModel sp = PlannedModel.fromQueryDocumentSnapshot(queryDocSnapshot: item);
                        return transactioncart(sp,idwallet);}
                  );
                }
              }
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(idwallet).snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              final WalletModel walletModel = WalletModel.fromDocumentSnapshot(documentSnapshot: snapshot.data);
              return FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddPlannedPayment(idwallet,walletModel.name)));
                  },
                  child: Icon(Icons.add, size: 36, color: Colors.black),
                  backgroundColor: Color(0xFFF40057));
            }
        ),
      ),
    );
  }

  void _showDialog(PlannedModel sp,String idwallet) {
    showDialog(
      context: this.context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              side: BorderSide(color: Color(0xFF8D8E90))),
          title: Text(
            "Delete transaction?",
            style: TextStyle(color: Color(0xFF8D8E90)),
          ),
          content: Container(
            child: Text(
              "Are you sure you want to delete this transaction",
              style: TextStyle(color: Color(0xFF8D8E90),fontSize: 18),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(primary: Color(0xFF8D8E90)),
              child: Text(
                'No',
                style: TextStyle(color: Colors.grey[50]),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xFF8D8E90)),
                child: new Text(
                  "Yes",
                  style: TextStyle(color: Colors.grey[50]),
                ),
                onPressed: () => deleteTransaction(sp,idwallet)
            ),
          ],
        );
      },
    );
  }

  deleteTransaction(PlannedModel sp,String idwallet) async {
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(idwallet).collection("plannedtransactions").doc(sp.id).delete();
    // Navigator.pop(context);
  }

  maskaspaid(PlannedModel sp,String idwallet) async {
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(idwallet).collection("plannedtransactions").doc(sp.id).get().then((value) async {
      await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(idwallet).collection("transactions").add({
        "walletname": sp.walletname,
        "name": sp.name,
        "spending": sp.spending,
        "datespend": sp.datespend,
        "note": sp.note,
        "photo": "",
        "classify": sp.classify,
        "idcategory": sp.idcategory,
      });
      await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(idwallet).collection("plannedtransactions").doc(sp.id).delete();
      // Navigator.pop(context);
    });
  }

  GestureDetector transactioncart(PlannedModel sp,String idwallet){
    return GestureDetector(
      onLongPress: (){_showDialog(sp, idwallet);},
      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => EditPlannedPayment(sp,idwallet)));},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF1B1C1E),
          ),
          // color: Color(0xFF1B1C1E),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.monetization_on_outlined,
                      color: Color(0xFFF40057), size: 22),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Day ${sp.datespend.day} Month ${sp.datespend.month} Year ${sp.datespend.year}",
                              style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700)),
                          Text("${sp.name}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700)),
                          Text("${sp.note}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Color(0xFF787878),
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700)),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        text: "${formatter.format(double.parse(sp.spending))}",
                        style: TextStyle(
                            color: Color(0xFFF40057),
                            fontFamily: 'RobotoSlab',
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                        children: [
                          TextSpan(text: '\n'),
                          TextSpan(text: 'VNĐ')
                        ]),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: ElevatedButton(
                  onPressed: () {
                    maskaspaid(sp,idwallet);
                  },
                  style: ElevatedButton.styleFrom(primary: Color(0xFFF40057)),
                  child: Text(
                    'Mask as Paid',
                    style: TextStyle(color: Colors.grey[50]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

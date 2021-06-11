import 'package:e_wallet/models/spending_model.dart';
import 'package:e_wallet/models/user_model.dart';
import 'package:e_wallet/models/wallet_model.dart';
import 'package:e_wallet/screen/add_screen/add_wallet.dart';
import 'package:e_wallet/screen/edit_screen/edit_wallet.dart';
import 'package:e_wallet/screen/edit_screen/edit_transaction.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formatter = new NumberFormat("#,###");
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(14, 24, 14, 0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          final UserModel user = UserModel.fromDocumentSnapshot(documentSnapshot: snapshot.data);
            return SingleChildScrollView(
              child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(
                      children: [
                        Container(
                        height: 150,
                          width: MediaQuery.of(context).size.width*0.485,
                          child: StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection("users").doc(user.id).collection("wallets").doc(user.idwallet).snapshots(),
                            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Center(child: CircularProgressIndicator());
                              }
                              if (snapshot.hasError) {
                                return Center(child: Text(snapshot.error.toString()));
                              }
                              DocumentSnapshot document = snapshot.data;
                              if(!document.exists){
                                return Container(
                                  padding: EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF1B1C1E),
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                  ),
                                  child: Text(
                                    "You dont' have any wallet",
                                    style: TextStyle(
                                        fontFamily: 'RobotoSlab',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: Color(0xFF787878)),
                                  ),
                                );
                              }
                              else{
                                final WalletModel wallet = WalletModel.fromDocumentSnapshot(documentSnapshot: snapshot.data);
                                return GestureDetector(
                                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => EditWallet(wallet)));},
                                  child: Container(
                                    padding: EdgeInsets.all(18),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF1B1C1E),
                                      borderRadius: BorderRadius.all(Radius.circular(16)),
                                    ),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: Color(0xFF26C5DA),
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(4)),
                                            ),
                                            child: Icon(Icons.attach_money),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            "${wallet.name}",
                                            style: TextStyle(
                                                fontFamily: 'RobotoSlab',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                                color: Color(0xFF787878)),
                                          ),
                                          StreamBuilder<QuerySnapshot>(
                                            stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(user.idwallet).collection("transactions").snapshots(),
                                            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                              if (snapshot.connectionState == ConnectionState.waiting) {
                                                return Center(child: CircularProgressIndicator());
                                              }
                                              if (snapshot.hasError) {
                                                return Center(child: Text(snapshot.error.toString()));
                                              }
                                              QuerySnapshot query = snapshot.data;
                                              if(query.size == 0){
                                                return RichText(
                                                  text: TextSpan(
                                                      text: "${formatter.format(double.parse(wallet.balances))}",
                                                      style: TextStyle(
                                                          color: Color(0xFFCCCCCC),
                                                          fontFamily: 'RobotoSlab',
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w700),
                                                      children: [
                                                        TextSpan(text: '\n'),
                                                        TextSpan(text: 'VNĐ')
                                                      ]),
                                                );
                                              }
                                              else{
                                                double totalsWallet(){
                                                  double tempcounter = double.parse(wallet.balances);
                                                  for(int i = 0;i<query.size;i++){
                                                    final item = query.docs[i];
                                                    final SpendingModel spendingmodel = SpendingModel.fromQueryDocumentSnapshot(queryDocSnapshot: item);
                                                    if(spendingmodel.classify == "0"){
                                                      tempcounter -= double.parse(spendingmodel.spending);
                                                    }
                                                    else{
                                                      tempcounter += double.parse(spendingmodel.spending);
                                                    }
                                                  }
                                                  // print(tempcounter);
                                                  return tempcounter;
                                                }
                                                return RichText(
                                                  text: TextSpan(
                                                      text: "${formatter.format(totalsWallet())}",
                                                      style: TextStyle(
                                                          color: Color(0xFFCCCCCC),
                                                          fontFamily: 'RobotoSlab',
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w700),
                                                      children: [
                                                        TextSpan(text: '\n'),
                                                        TextSpan(text: 'VNĐ')
                                                      ]),
                                                );
                                              }
                                            }
                                          ),
                                        ]),
                                  ),
                                );
                              }
                            }
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width*0.4,
                        child: Container(
                          padding: EdgeInsets.all(18),
                          decoration: BoxDecoration(
                          color: Color(0xFF1B1C1E),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            FloatingActionButton(
                              heroTag: Text("btnaddwallet"),
                              onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => AddWallet()));},
                              child: Icon(Icons.add, size: 50, color: Colors.black),
                            backgroundColor: Color(0xFFF40057)),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Add Wallet',
                              style: TextStyle(
                              color: Color(0xFFCCCCCC),
                              fontFamily: 'RobotoSlab',
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                            )
                         ]),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                  height: 30,
                  ),
                  Text('All transactions',
                    style: TextStyle(
                    color: Color(0xFFCCCCCC),
                    fontFamily: 'RobotoSlab',
                    fontSize: 20,
                    fontWeight: FontWeight.w700)),
                    SizedBox(height: 12),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(user.idwallet).collection("transactions").orderBy("datespend",descending: true).snapshots(),
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
                                  Text("You don't have any transaction yet",style: TextStyle(
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
                                  final SpendingModel sp = SpendingModel.fromQueryDocumentSnapshot(queryDocSnapshot: item);
                                  return transactioncart(sp,user.idwallet);}
                          );
                        }
                      }
                    ),
                  ),
            ]),
          );
        }
      ));
  }
////// này của ds chi tiêu
  void _showDialog(SpendingModel sp,String idwallet) {
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

  deleteTransaction(SpendingModel sp,String idwallet) async {
    if(sp.photo != ""){
      var photo = FirebaseStorage.instance.refFromURL(sp.photo);
      await photo.delete();
    }
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(idwallet).collection("transactions").doc(sp.id).delete();
    Navigator.pop(context);
  }

  GestureDetector transactioncart(SpendingModel sp,String idwallet){
    return GestureDetector(
      onLongPress: (){_showDialog(sp, idwallet);},
      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => EditTransaction(sp,idwallet)));},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF1B1C1E),
          ),
          // color: Color(0xFF1B1C1E),
          child: Row(
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
                    text: sp.classify == "0" ? "-${formatter.format(double.parse(sp.spending))}" : "+${formatter.format(double.parse(sp.spending))}",
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
        ),
      ),
    );
  }
}


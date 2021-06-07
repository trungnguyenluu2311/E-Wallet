import 'package:e_wallet/screen/add_screen/add_category.dart';
import 'package:e_wallet/screen/detail_screen/detail_category.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_wallet/models/wallet_model.dart';
import 'package:e_wallet/models/user_model.dart';
import 'package:e_wallet/models/spending_model.dart';
import 'package:e_wallet/screen/add_screen/add_wallet.dart';
import 'package:e_wallet/screen/edit_screen/edit_wallet.dart';

class Listwallet extends StatefulWidget {
  @override
  _ListwalletState createState() => _ListwalletState();
}

class _ListwalletState extends State<Listwallet> {

  Future<void> _alterDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Notification"),
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

  void _showDialog(String idwallet,String idwalletnow) {
    showDialog(
      context: this.context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              side: BorderSide(color: Color(0xFF8D8E90))),
          title: Text(
            "Delete wallet?",
            style: TextStyle(color: Color(0xFF8D8E90)),
          ),
          content: Container(
            child: Text(
              "Are you sure you want to delete this wallet",
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
                onPressed: () => deleteWallet(idwallet,idwalletnow)
            ),
          ],
        );
      },
    );
  }

  choseWallet(String idwallet) async {
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).update({
      "idwallet": idwallet,
    });
  }

  deleteWallet(String idwallet,String idwalletnow) async {
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(idwallet).collection("transactions").get().then((value) async {
      for (DocumentSnapshot ds in value.docs){
        final transaction = SpendingModel.fromDocumentSnapshot(documentSnapshot: ds);
        if(transaction.photo != ""){
          var photo = FirebaseStorage.instance.refFromURL(transaction.photo);
          await photo.delete();
        }
        ds.reference.delete();
      };
    });
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(idwallet).delete();
    if(idwallet == idwalletnow){
      await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").orderBy("datecreated",descending: true).get().then((value) async {
        if(value.size > 0){
          await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).update({
            "idwallet": value.docs.first.id,
          });}
        else{
          await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).update({
            "idwallet": "nonewallet",
          });
        }
      });
    }
    Navigator.pop(context);
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
              final UserModel user = UserModel.fromDocumentSnapshot(documentSnapshot: snapshot.data);
              return Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  leading: BackButton(
                    color: Color(0xFFCC0047),
                  ),
                  title: Text(
                    'Wallets',
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
                  color: Colors.black,
                  // decoration: BoxDecoration(color: Colors.black),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").orderBy("datecreated",descending: true).snapshots(),
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
                                  Text("You don't have any wallet yet",
                                    style: TextStyle(color: Color(0xFF787878),fontSize: 25),),
                                ],
                              )
                          );
                        }
                        else{
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            // padding: const EdgeInsets.all(14),
                            color: Colors.black,
                            child: ListView.builder(
                              // physics: NeverScrollableScrollPhysics(),
                              // shrinkWrap: true,
                                itemCount: query.size,
                                itemBuilder: (context, index) {
                                  final item = query.docs[index];
                                  final wallet = WalletModel.fromQueryDocumentSnapshot(queryDocSnapshot: item);
                                  return walletscard(wallet,user.idwallet);}),
                          );
                        }
                      }
                  ),
                ),
                floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
                floatingActionButton: FloatingActionButton(
                    onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => AddWallet()));},
                    child: Icon(Icons.add, size: 50, color: Colors.black),
                    backgroundColor: Color(0xFFF40057)),
              );
            }
        )
    );
  }

  GestureDetector walletscard(WalletModel wallet,String idwalletnow){
    if(idwalletnow == wallet.id){
      return GestureDetector(
          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => EditWallet(wallet)));},
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_balance_wallet_outlined,
                      size: 30,
                      color: Color(0xFFF40057),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        '${wallet.name}',
                        style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontFamily: 'RobotoSlab',
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {_alterDialogBuilder("This is your wallet now");},
                        child: Icon(Icons.check_outlined,
                            color: Color(0xFFF40057))),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {_showDialog(wallet.id,idwalletnow);},
                        child: Icon(Icons.delete,
                            color: Color(0xFF787878)))
                  ],
                ),
              ),
            ],
          )
      );
    }
    else{
      return GestureDetector(
          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => EditWallet(wallet)));},
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_balance_wallet_outlined,
                      size: 30,
                      color: Color(0xFFF40057),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        '${wallet.name}',
                        style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontFamily: 'RobotoSlab',
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {choseWallet(wallet.id);},
                        child: Icon(Icons.check_outlined,
                            color: Color(0xFF787878))),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () { _showDialog(wallet.id,idwalletnow);},
                        child: Icon(Icons.delete,
                            color: Color(0xFF787878)))
                  ],
                ),
              ),
            ],
          )
      );
    }
  }
}

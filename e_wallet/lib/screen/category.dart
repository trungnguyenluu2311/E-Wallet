import 'package:e_wallet/models/category_model.dart';
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

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  void _showDialog(String idcategory) {
    showDialog(
      context: this.context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              side: BorderSide(color: Color(0xFF8D8E90))),
          title: Text(
            "Delete category?",
            style: TextStyle(color: Color(0xFF8D8E90)),
          ),
          content: Container(
            child: Text(
              "Are you sure you want to delete this category",
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
                onPressed: () => deleteCategory(idcategory)
            ),
          ],
        );
      },
    );
  }

  deleteCategory(String idcategory) async {
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").get().then((value) async {
      for (DocumentSnapshot ds1 in value.docs){
        await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(ds1.id).collection("transactions").get().then((value) async {
          for (DocumentSnapshot ds2 in value.docs){
            final transaction = SpendingModel.fromDocumentSnapshot(documentSnapshot: ds2);
            if(transaction.idcategory == idcategory){
              await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(ds1.id).collection("transactions").doc(ds2.id).update({
                "idcategory": "nonecategory",
              });
            }
          };
        });
      };
    });
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("categorys").doc(idcategory).delete();
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
          final UserModel user = UserModel.fromDocumentSnapshot(documentSnapshot: snapshot.data!);
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                leading: BackButton(
                  color: Color(0xFFCC0047),
                ),
                title: Text(
                  'Category',
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
                    stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("categorys").snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      }
                      QuerySnapshot query = snapshot.data!;
                      if(query.size == 0){
                        return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("You don't have any category yet",
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
                                final category = CategoryModel.fromQueryDocumentSnapshot(queryDocSnapshot: item);
                                return categorycard(category);}),
                                // return Text("hi");}),
                        );
                      }
                    }
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
              floatingActionButton: FloatingActionButton(
                  onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => AddCategory()));},
                  child: Icon(Icons.add, size: 50, color: Colors.black),
                  backgroundColor: Color(0xFFF40057)),
            );
        }
      )
    );
  }

  GestureDetector categorycard(CategoryModel category){
    return GestureDetector(
        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => DetailCategory(category)));},
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
                    Icons.circle,
                    size: 30,
                    color: Color(int.parse(category.color)),
                    // color: Color(0xFFF40057),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Text(
                      '${category.name}',
                      style: TextStyle(
                          color: Color(0xFFCCCCCC),
                          fontFamily: 'RobotoSlab',
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {_showDialog(category.id);},
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

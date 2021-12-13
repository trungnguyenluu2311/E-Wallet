import 'package:e_wallet/models/spending_model.dart';
import 'package:e_wallet/screen/edit_screen/edit_category.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_wallet/models/category_model.dart';

class DetailCategory extends StatefulWidget {
  final CategoryModel category;
  DetailCategory(this.category);
  @override
  _DetailCategoryState createState() => _DetailCategoryState(category);
}

class _DetailCategoryState extends State<DetailCategory> {
  final CategoryModel category;
  _DetailCategoryState(this.category);

  Color? currentColor;

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
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    currentColor = Color(int.parse(category.color));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              actions: [
                GestureDetector(
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => EditCategory(category)));
                    },
                    child: Icon(
                      Icons.edit,
                      color: Color(0xFFCC0047),
                    ))
              ],
              leading: BackButton(color: Color(0xFFCC0047)),
              backgroundColor: Colors.black,
              centerTitle: true,
              shadowColor: Colors.white,
              title: Text(
                'Detail category',
                style: TextStyle(
                    color: Color(0xFFCCCCCC),
                    fontFamily: 'RobotoSlab',
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              )),
          body: Container(
              padding: EdgeInsets.fromLTRB(0, 24, 0, 24),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Colors.black),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(14),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                      child: Column(children: [
                        Icon(
                          Icons.circle,
                          size: 60,
                          color: currentColor,
                        ),
                        Text(
                          "${category.name}",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'RobotoSlab',
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 24, 0, 24),
                      child: Text(
                        'Detail category',
                        style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontFamily: 'RobotoSlab',
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 3),
                    Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.note,
                              size: 26,
                              color: Color(0xFF787878),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Text(
                              "${category.note}",
                              style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 58,
                    ),
                    GestureDetector(
                      onTap: () {_showDialog(category.id);},
                      child: Container(
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete,
                                size: 26,
                                color: Color(0xFFF40057),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Text(
                                'Delete',
                                style: TextStyle(
                                    color: Color(0xFFF40057),
                                    fontFamily: 'RobotoSlab',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ))),
    );
  }
}

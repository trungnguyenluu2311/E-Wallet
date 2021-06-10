import 'package:e_wallet/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SelectCategory extends StatefulWidget {
  String idcategorynow;
  SelectCategory(this.idcategorynow);
  @override
  _SelectCategoryState createState() => _SelectCategoryState(idcategorynow);
}

class _SelectCategoryState extends State<SelectCategory> {
  String idcategorynow;
  _SelectCategoryState(this.idcategorynow);

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

  choseCategory(CategoryModel category) async {
    Navigator.pop(context, "${category.id}");
  }

  deletechoseCategory() async {
    Navigator.pop(context, "nonecategory");
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
              return Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  leading: BackButton(
                    color: Color(0xFFCC0047),
                    // color: Colors.red,
                    onPressed: (){
                      Navigator.pop(context, "$idcategorynow");
                    },
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 5, 0),
                      child: GestureDetector(
                          onTap: () {
                            deletechoseCategory();
                          },
                          child: Icon(
                            Icons.delete,
                            size: 28,
                            color: Color(0xFFCC0047),
                          )),
                    )
                  ],
                  title: Text(
                    'Choose Category',
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
                        QuerySnapshot query = snapshot.data;
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
                                  return categorycard(category,idcategorynow);}),
                            // return Text("hi");}),
                          );
                        }
                      }
                  ),
                ),
              );
            }
        )
    );
  }

  GestureDetector categorycard(CategoryModel category,String idcategorynow){
    if(idcategorynow == category.id){
      return GestureDetector(
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
                        onTap: () {_alterDialogBuilder("This is your category now");},
                        child: Icon(Icons.check_outlined,
                            color: Color(0xFFF40057))),
                  ],
                ),
              ),
            ],
          )
      );
    }else{
      return GestureDetector(
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
                        onTap: () {choseCategory(category);},
                        child: Icon(Icons.check_outlined,
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

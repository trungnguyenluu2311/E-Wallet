import 'package:e_wallet/models/budget_model.dart';
import 'package:e_wallet/models/category_model.dart';
import 'package:e_wallet/models/planned_model.dart';
import 'package:e_wallet/screen/select_screen/confirmation.dart';
import 'package:e_wallet/screen/select_screen/select_category.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class EditBudget extends StatefulWidget {
  final BudgetModel budgetModel;
  final String idwallet;
  EditBudget(this.budgetModel,this.idwallet);
  @override
  _EditBudgetState createState() => _EditBudgetState(budgetModel,idwallet);
}

class _EditBudgetState extends State<EditBudget> {
  dynamic _selectedType = 0;
  final BudgetModel budgetModel;
  final String idwallet;
  _EditBudgetState(this.budgetModel,this.idwallet);

  String _walletname = "";
  final TextEditingController _transactionnameInputCtrl = TextEditingController();
  final TextEditingController _spendingInputCtrl = TextEditingController();

  String idtemptransaction = "nonecategory";
  DateTime selectedDate = DateTime.now();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // _selectDate(BuildContext context) async {
  //   final DateTime picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2050),
  //   );
  //   if (picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //     });
  // }

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

  editTransaction() async {
    if(_transactionnameInputCtrl.text != "" && _spendingInputCtrl.text != "") {
      if(idtemptransaction != "nonecategory"){
        DocumentReference docRef = _firestore.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(idwallet).collection("budgets").doc(budgetModel.id);
        await docRef.update({
          "name": _transactionnameInputCtrl.text,
          "spending": _spendingInputCtrl.text,
          "idcategory": idtemptransaction,
        });
        Navigator.pop(context);
      }
      else{
        _alterDialogBuilder("You need to choose category");
      }
    }
    else{
      _alterDialogBuilder("Some field is missing");
    }
  }

  void _choosecategory(BuildContext context) async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => SelectCategory(idtemptransaction)),);
    setState(() {
      idtemptransaction = result;
    });
  }

  @override
  void initState() {
    super.initState();
    _walletname = budgetModel.walletname;
    _transactionnameInputCtrl.text = budgetModel.name;
    _spendingInputCtrl.text = budgetModel.spending;
    selectedDate = budgetModel.datespend;
    idtemptransaction = budgetModel.idcategory;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: BackButton(color: Color(0xFFCC0047)),
            backgroundColor: Colors.black,
            centerTitle: true,
            shadowColor: Colors.white,
            title: Text(
              'Edit budget',
              style: TextStyle(
                  color: Color(0xFFCCCCCC),
                  fontFamily: 'RobotoSlab',
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            )),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.black),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  TextField(
                      controller: _spendingInputCtrl,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 26, 0, 26),
                        filled: true,
                        fillColor: Color(0xFF1B1C1E),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(14)),
                              color: Color(0xFF8D8E90),
                            ),
                            child: Text(
                              'VN??',
                              style: TextStyle(
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(14, 14, 0, 14),
                    child: Text(
                      'General',
                      style: TextStyle(
                          color: Color(0xFFCCCCCC),
                          fontFamily: 'RobotoSlab',
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        color: Color(0xFF1B1C1E)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 14, 0, 14),
                      child: Row(
                        children: [
                          Icon(
                            Icons.account_balance_wallet_outlined,
                            size: 26,
                            color: Color(0xFF8D8E90),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              "$_walletname",
                              style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 20,fontFamily: 'RobotoSlab', fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  TextField(
                      controller: _transactionnameInputCtrl,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                        labelStyle: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontSize: 20,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w700),
                        labelText: 'Name Budget',
                        filled: true,
                        fillColor: Color(0xFF1B1C1E),
                        prefixIcon: Icon(
                          Icons.help,
                          size: 26,
                          color: Color(0xFF8D8E90),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                      )),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        color: Color(0xFF1B1C1E)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 14, 0, 14),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              _choosecategory(context);
                            },
                            child: Icon(
                              Icons.category,
                              size: 26,
                              color: Color(0xFF8D8E90),
                            ),
                          ),
                          StreamBuilder<DocumentSnapshot>(
                              stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("categorys").doc(idtemptransaction).snapshots(),
                              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      "Choose Category",
                                      style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 20,fontFamily: 'RobotoSlab', fontWeight: FontWeight.w700),
                                    ),
                                  );
                                  // return Center(child: CircularProgressIndicator());
                                }
                                if (snapshot.hasError) {
                                  return Center(child: Text(snapshot.error.toString()));
                                }
                                if(!snapshot.data!.exists){
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      "Choose Category",
                                      style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 20,fontFamily: 'RobotoSlab', fontWeight: FontWeight.w700),
                                    ),
                                  );
                                }else{
                                  final category = CategoryModel.fromDocumentSnapshot(documentSnapshot: snapshot.data!);
                                  // colorTemp = Color(int.parse(category.color));
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      "${category.name}",
                                      style: TextStyle(color: Color(int.parse(category.color)), fontSize: 20,fontFamily: 'RobotoSlab', fontWeight: FontWeight.w700),
                                    ),
                                  );
                                }
                              }
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        color: Color(0xFF1B1C1E)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 14, 0, 14),
                      child: Row(
                        children: [
                          GestureDetector(
                            // onTap: (){
                            //   _selectDate(context);
                            // },
                            child: Icon(
                              Icons.date_range,
                              size: 26,
                              color: Color(0xFF8D8E90),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              "Day ${selectedDate.day} Month ${selectedDate.month} Year ${selectedDate.year}",
                              style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 20,fontFamily: 'RobotoSlab', fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
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
                onPressed: () {editTransaction();},
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

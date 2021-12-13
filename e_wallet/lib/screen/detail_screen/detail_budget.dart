import 'package:e_wallet/models/budget_model.dart';
import 'package:e_wallet/models/category_model.dart';
import 'package:e_wallet/models/spending_model.dart';
import 'package:e_wallet/screen/edit_screen/edit_budget.dart';
import 'package:e_wallet/screen/edit_screen/edit_transaction.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

class DetailBudget extends StatefulWidget {
  final idwallet;
  final idbudget;
  DetailBudget(this.idwallet,this.idbudget);
  @override
  _DetailBudgetState createState() => _DetailBudgetState(idwallet,idbudget);
}

class _DetailBudgetState extends State<DetailBudget> {
  final idwallet;
  final idbudget;
  _DetailBudgetState(this.idwallet,this.idbudget);
  final formatter = new NumberFormat("#,###");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(idwallet).collection("budgets").doc(idbudget).snapshots(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            final BudgetModel budgetModel = BudgetModel.fromDocumentSnapshot(documentSnapshot: snapshot.data!);
            return Scaffold(
              appBar: AppBar(
                  leading: BackButton(color: Color(0xFFCC0047)),
                  backgroundColor: Colors.black,
                  centerTitle: true,
                  shadowColor: Colors.white,
                  actions: [
                    GestureDetector(
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => EditBudget(budgetModel,idwallet)));},
                        child: Icon(Icons.edit, color: Color(0xFFCC0047)))
                  ],
                  title: Text(
                    'Detail budget',
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                          child: Text(
                            "Budget",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'RobotoSlab',
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("categorys").doc(budgetModel.idcategory).snapshots(),
                            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Center(child: CircularProgressIndicator());
                              }
                              if (snapshot.hasError) {
                                return Center(child: Text(snapshot.error.toString()));
                              }
                              CategoryModel ct = CategoryModel.fromDocumentSnapshot(documentSnapshot: snapshot.data!);
                              return Container(
                                padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                                child: Column(children: [
                                  Icon(
                                    Icons.circle,
                                    size: 44,
                                    color: Color(int.parse(ct.color)),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "${budgetModel.name}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'RobotoSlab',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "${ct.name}",
                                    style: TextStyle(
                                        color: Color(0xFFCCCCCC),
                                        fontSize: 16,
                                        fontFamily: 'RobotoSlab',
                                        fontWeight: FontWeight.w400),
                                  ),
                                  StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(idwallet).collection("transactions").orderBy("datespend",descending: true).where("idcategory",isEqualTo: budgetModel.idcategory).snapshots(),
                                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return Center(child: CircularProgressIndicator());
                                        }
                                        if (snapshot.hasError) {
                                          return Center(child: Text(snapshot.error.toString()));
                                        }
                                        QuerySnapshot query = snapshot.data!;
                                        if(query.size == 0){
                                          return Text(
                                            "${formatter.format(double.parse(budgetModel.spending))} VNĐ",
                                          style: TextStyle(
                                          color: Color(0xFF999999),
                                          fontSize: 16,
                                          fontFamily: 'RobotoSlab',
                                          fontWeight: FontWeight.w700),
                                          );
                                        }else{
                                          double totalsWallet(){
                                            double tempcounter = double.parse(budgetModel.spending);
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
                                          return Text(
                                            "${formatter.format(totalsWallet())} VNĐ",
                                            style: TextStyle(
                                                color: Color(0xFF999999),
                                                fontSize: 16,
                                                fontFamily: 'RobotoSlab',
                                                fontWeight: FontWeight.w700),
                                          );
                                        }
                                      }
                                  ),
                                ]),
                              );
                            }
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 10, 0, 14),
                          child: Text('Transaction under budget',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'RobotoSlab',
                                  fontWeight: FontWeight.w700)),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(idwallet).collection("transactions").orderBy("datespend",descending: true).where("idcategory",isEqualTo: budgetModel.idcategory).snapshots(),
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
                                        Text("You don't have any transaction yet",style: TextStyle(
                                          color: Colors.white,
                                        ),),
                                      ],
                                    )
                                );
                              }else{
                                return ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: query.size,
                                    itemBuilder: (context, index) {
                                      final item = query.docs[index];
                                      final SpendingModel sp = SpendingModel.fromQueryDocumentSnapshot(queryDocSnapshot: item);
                                      return transactioncart(sp,idwallet);}
                                );
                              }
                            }
                        ),
                      ],
                    ),
                  )),
            );
          }
      )
    );
  }

  GestureDetector transactioncart(SpendingModel sp,String idwallet){
    return GestureDetector(
      // onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => EditTransaction(sp,idwallet)));},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
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

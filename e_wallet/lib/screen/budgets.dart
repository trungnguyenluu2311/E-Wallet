import 'package:e_wallet/models/budget_model.dart';
import 'package:e_wallet/models/category_model.dart';
import 'package:e_wallet/models/spending_model.dart';
import 'package:e_wallet/models/wallet_model.dart';
import 'package:e_wallet/screen/add_screen/add_budget.dart';
import 'package:e_wallet/screen/detail_screen/detail_budget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

class Budgets extends StatefulWidget {
  final idwallet;
  Budgets(this.idwallet);
  @override
  _BudgetsState createState() => _BudgetsState(idwallet);
}

class _BudgetsState extends State<Budgets> {
  final formatter = new NumberFormat("#,###");
  final idwallet;
  _BudgetsState(this.idwallet);
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
            'Budgets',
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
              stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(idwallet).collection("budgets").orderBy("datespend",descending: true).snapshots(),
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
                          Text("You don't have any budget yet",style: TextStyle(
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
                        final BudgetModel sp = BudgetModel.fromQueryDocumentSnapshot(queryDocSnapshot: item);
                        return budgetcard(sp,idwallet);}
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
                        MaterialPageRoute(builder: (context) => AddBudget(idwallet,walletModel.name)));
                  },
                  child: Icon(Icons.add, size: 36, color: Colors.black),
                  backgroundColor: Color(0xFFF40057));
            }
        ),
      ),
    );
  }

  void _showDialog(BudgetModel sp,String idwallet) {
    showDialog(
      context: this.context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              side: BorderSide(color: Color(0xFF8D8E90))),
          title: Text(
            "Delete budget?",
            style: TextStyle(color: Color(0xFF8D8E90)),
          ),
          content: Container(
            child: Text(
              "Are you sure you want to delete this budget",
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
                onPressed: () => deleteBudget(sp,idwallet)
            ),
          ],
        );
      },
    );
  }

  deleteBudget(BudgetModel sp,String idwallet) async {
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(idwallet).collection("budgets").doc(sp.id).delete();
    Navigator.pop(context);
  }

  GestureDetector budgetcard(BudgetModel sp,String idwallet){
    return GestureDetector(
      onLongPress: (){_showDialog(sp, idwallet);},
      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => DetailBudget(idwallet,sp.id)));},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF1B1C1E),
          ),
          // color: Color(0xFF1B1C1E),
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("categorys").doc(sp.idcategory).snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              CategoryModel ct = CategoryModel.fromDocumentSnapshot(documentSnapshot: snapshot.data);
              return Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle,
                          color: Color(int.parse(ct.color)), size: 30),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${sp.name}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Color(0xFFCCCCCC),
                                      fontFamily: 'RobotoSlab',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                            ]),
                      ),
                      StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(idwallet).collection("transactions").orderBy("datespend",descending: true).where("idcategory",isEqualTo: sp.idcategory).snapshots(),
                          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }
                            if (snapshot.hasError) {
                              return Center(child: Text(snapshot.error.toString()));
                            }
                            QuerySnapshot query = snapshot.data;
                            if(query.size == 0){
                              return Text(
                                "${sp.spending}",
                                style: TextStyle(
                                    color: Color(0xFF999999),
                                    fontSize: 16,
                                    fontFamily: 'RobotoSlab',
                                    fontWeight: FontWeight.w700),
                              );
                            }else{
                              double totalsWallet(){
                                double tempcounter = double.parse(sp.spending);
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
                    ],
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }

}

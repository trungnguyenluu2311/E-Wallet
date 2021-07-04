import 'package:e_wallet/models/chart_column.dart';
import 'package:e_wallet/models/spending_model.dart';
import 'package:e_wallet/models/user_model.dart';
import 'package:e_wallet/models/wallet_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:e_wallet/widget/chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatisticScreen extends StatefulWidget {
  @override
  _StatisticScreenState createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  final formatter = new NumberFormat("#,###");
  SpendingModel sp;
  double tongthu1 = 0;
  double tongthu2 = 0;
  double tongthu3 = 0;
  double tongthu4 = 0;
  double tongthu5 = 0;
  double tongthu6 = 0;
  double tongthu7 = 0;
  double tongthu8 = 0;
  double tongthu9 = 0;
  double tongthu10 = 0;
  double tongthu11 = 0;
  double tongthu12 = 0;

  double tongChi1 = 0;
  double tongChi2 = 0;
  double tongChi3 = 0;
  double tongChi4 = 0;
  double tongChi5 = 0;
  double tongChi6 = 0;
  double tongChi7 = 0;
  double tongChi8 = 0;
  double tongChi9 = 0;
  double tongChi10 = 0;
  double tongChi11 = 0;
  double tongChi12 = 0;

  final List<ChartColumn> datathu = [
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff0984FB)),
      year: "1",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff0984FB)),
      year: "2",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff0984FB)),
      year: "3",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff0984FB)),
      year: "4",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff0984FB)),
      year: "5",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff0984FB)),
      year: "6",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff0984FB)),
      year: "7",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff0984FB)),
      year: "8",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff0984FB)),
      year: "9",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff0984FB)),
      year: "10",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff0984FB)),
      year: "11",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff0984FB)),
      year: "12",
    ),
  ];
  final List<ChartColumn> datachi = [
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xffF40057)),
      year: "1",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xffF40057)),
      year: "2",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xffF40057)),
      year: "3",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xffF40057)),
      year: "4",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xffF40057)),
      year: "5",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xffF40057)),
      year: "6",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xffF40057)),
      year: "7",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xffF40057)),
      year: "8",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xffF40057)),
      year: "9",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xffF40057)),
      year: "10",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xffF40057)),
      year: "11",
    ),
    ChartColumn(
      thuchi: 0,
      barColor: charts.ColorUtil.fromDartColor(Color(0xffF40057)),
      year: "12",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          final UserModel user =
              UserModel.fromDocumentSnapshot(documentSnapshot: snapshot.data);
          return StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance.collection("users").doc(user.id).collection("wallets").doc(user.idwallet).snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              DocumentSnapshot document = snapshot.data;
              if(!document.exists){
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      "You dont' have any wallet",
                      style: TextStyle(
                          fontFamily: 'RobotoSlab',
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          color: Color(0xFF787878)),
                    ),
                  ),
                );
              }else{
                return StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser.uid)
                        .collection("wallets")
                        .doc(user.idwallet)
                        .collection("transactions")
                        .orderBy("datespend", descending: true)
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          padding: EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.black,
                          ),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      }
                      QuerySnapshot query = snapshot.data;
                      if (query.size == 0) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          padding: EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Text(
                              "You dont' have any transaction",
                              style: TextStyle(
                                  fontFamily: 'RobotoSlab',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Color(0xFF787878)),
                            ),
                          ),
                        );
                      } else {
                        for (var i = 0; i < query.size; i++) {
                          final item = query.docs[i];
                          final SpendingModel sp =
                          SpendingModel.fromQueryDocumentSnapshot(
                              queryDocSnapshot: item);
                          if (sp.classify == "0") {
                            if (sp.datespend.month.toString() == "1") {
                              tongChi1 += double.parse(sp.spending);
                              datachi[0].thuchi = tongChi1.toInt();
                            }
                            else if (sp.datespend.month.toString() == "2") {
                              tongChi2 += double.parse(sp.spending);
                              datachi[1].thuchi = tongChi2.toInt();
                            }
                            else if (sp.datespend.month.toString() == "3") {
                              tongChi3 += double.parse(sp.spending);
                              datachi[2].thuchi = tongChi3.toInt();
                            }
                            else if (sp.datespend.month.toString() == "4") {
                              tongChi4 += double.parse(sp.spending);
                              datachi[3].thuchi = tongChi4.toInt();
                            }
                            else if (sp.datespend.month.toString() == "5") {
                              tongChi5 += double.parse(sp.spending);
                              datachi[4].thuchi = tongChi5.toInt();
                            }
                            else if (sp.datespend.month.toString() == "6") {
                              tongChi6 += double.parse(sp.spending);
                              datachi[5].thuchi = tongChi6.toInt();
                            }
                            else if (sp.datespend.month.toString() == "7") {
                              tongChi7 += double.parse(sp.spending);
                              datachi[6].thuchi = tongChi7.toInt();
                            }
                            else if (sp.datespend.month.toString() == "8") {
                              tongChi8 += double.parse(sp.spending);
                              datachi[7].thuchi = tongChi8.toInt();
                            }
                            else if (sp.datespend.month.toString() == "9") {
                              tongChi9 += double.parse(sp.spending);
                              datachi[8].thuchi = tongChi9.toInt();
                            }
                            else if (sp.datespend.month.toString() == "10") {
                              tongChi10 += double.parse(sp.spending);
                              datachi[9].thuchi = tongChi10.toInt();
                            }
                            else if (sp.datespend.month.toString() == "11") {
                              tongChi11 += double.parse(sp.spending);
                              datachi[10].thuchi = tongChi11.toInt();
                            }
                            else if (sp.datespend.month.toString() == "12") {
                              tongChi12 += double.parse(sp.spending);
                              datachi[11].thuchi = tongChi12.toInt();
                            }
                          }
                          else if (sp.classify == "1") {
                            if (sp.datespend.month.toString() == "1") {
                              tongthu1 += double.parse(sp.spending);
                              datathu[0].thuchi = tongthu1.toInt();
                            }
                            else if (sp.datespend.month.toString() == "2") {
                              tongthu2 += double.parse(sp.spending);
                              datathu[1].thuchi = tongthu2.toInt();
                            }
                            else if (sp.datespend.month.toString() == "3") {
                              tongthu3 += double.parse(sp.spending);
                              datathu[2].thuchi = tongthu3.toInt();
                            }
                            else if (sp.datespend.month.toString() == "4") {
                              tongthu4 += double.parse(sp.spending);
                              datathu[3].thuchi = tongthu4.toInt();
                            }
                            else if (sp.datespend.month.toString() == "5") {
                              tongthu5 += double.parse(sp.spending);
                              datathu[4].thuchi = tongthu5.toInt();
                            }
                            else if (sp.datespend.month.toString() == "6") {
                              tongthu6 += double.parse(sp.spending);
                              datathu[5].thuchi = tongthu6.toInt();
                            }
                            else if (sp.datespend.month.toString() == "7") {
                              tongthu7 += double.parse(sp.spending);
                              datathu[6].thuchi = tongthu7.toInt();
                            }
                            else if (sp.datespend.month.toString() == "8") {
                              tongthu8 += double.parse(sp.spending);
                              datathu[7].thuchi = tongthu8.toInt();
                            }
                            else if (sp.datespend.month.toString() == "9") {
                              tongthu9 += double.parse(sp.spending);
                              datathu[8].thuchi = tongthu9.toInt();
                            }
                            else if (sp.datespend.month.toString() == "10") {
                              tongthu10 += double.parse(sp.spending);
                              datathu[9].thuchi = tongthu10.toInt();
                            }
                            else if (sp.datespend.month.toString() == "11") {
                              tongthu11 += double.parse(sp.spending);
                              datathu[10].thuchi = tongthu11.toInt();
                            }
                            else if (sp.datespend.month.toString() == "12") {
                              tongthu12 += double.parse(sp.spending);
                              datathu[11].thuchi = tongthu12.toInt();
                            }
                          }
                        }
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.black,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: 12,),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(horizontal: 12),
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
                                          return Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFF1B1C1E),
                                              borderRadius: BorderRadius.all(Radius.circular(16)),
                                            ),
                                            child: Column(
                                                children: [
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
                                                          return Center(
                                                            child: RichText(
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
                                                            ),
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
                                                          return Center(
                                                              child: Text("Current Balance \n${formatter.format(totalsWallet())}",
                                                                style:TextStyle(
                                                                    color: Color(0xFFCCCCCC),
                                                                    fontFamily: 'RobotoSlab',
                                                                    fontSize: 18,
                                                                    fontWeight: FontWeight.w700
                                                                ),
                                                                textAlign: TextAlign.center,)
                                                          );
                                                        }
                                                      }
                                                  ),
                                                ]),
                                          );
                                        }
                                      }
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(24, 14, 0, 14),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: Color(0xFF0984FB),
                                              radius: 20,
                                            ),
                                            SizedBox(width: 12,),
                                            Text(
                                              'Income',
                                              style: TextStyle(
                                                  color: Color(0xFF787878),
                                                  fontFamily: 'RobotoSlab',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    VerticalDivider(
                                      thickness: 1,
                                      color: Color(0xFFCCCCCC),
                                    ),
                                    Expanded(
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(12, 14, 0, 14),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: Color(0xFFF40057),
                                                radius: 20,
                                              ),
                                              SizedBox(width: 12,),
                                              Text(
                                                'Expense',
                                                style: TextStyle(
                                                    color: Color(0xFF787878),
                                                    fontFamily: 'RobotoSlab',
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                                Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width,
                                          height: 480,
                                          child: Stack(
                                            children: [
                                              ChartWidget(
                                                  datachi: datachi, datathu: datathu)
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        );
                      }
                    });
              }
            });
        });
  }
}

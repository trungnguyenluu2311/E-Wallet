import 'package:cloud_firestore/cloud_firestore.dart';

class WalletModel {
  String id;
  String name;
  String balances;
  DateTime datecreated;
  // String currency;

  WalletModel({
    this.id,
    this.name,
    this.balances,
    this.datecreated,
    // this.currency,
  });

  WalletModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    balances = documentSnapshot["balances"];
    datecreated = documentSnapshot["datecreated"].toDate();
    // currency = documentSnapshot["currency"];
  }

  WalletModel.fromQueryDocumentSnapshot({QueryDocumentSnapshot queryDocSnapshot}) {
    var data = queryDocSnapshot.data();
    id = queryDocSnapshot.id;
    name = data["name"];
    datecreated = data["datecreated"].toDate();
    // currency = data["currency"];
  }
}
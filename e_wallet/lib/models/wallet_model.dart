import 'package:cloud_firestore/cloud_firestore.dart';

class WalletModel {
  String id;
  String name;
  String balances;
  // String currency;

  WalletModel({
    this.id,
    this.name,
    this.balances,
    // this.currency,
  });

  WalletModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    balances = documentSnapshot["balances"];
    // currency = documentSnapshot["currency"];
  }

  WalletModel.fromQueryDocumentSnapshot({QueryDocumentSnapshot queryDocSnapshot}) {
    var data = queryDocSnapshot.data();
    id = queryDocSnapshot.id;
    name = data["name"];
    balances = data["balances"] ;
    // currency = data["currency"];
  }
}
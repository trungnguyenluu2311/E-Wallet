import 'package:cloud_firestore/cloud_firestore.dart';

class WalletModel {
  late String id;
  late String name;
  late String balances;
  late DateTime datecreated;
  // String currency;

  WalletModel({
    required this.id,
    required this.name,
    required this.balances,
    required this.datecreated,
    // this.currency,
  });

  WalletModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    balances = documentSnapshot["balances"];
    datecreated = documentSnapshot["datecreated"].toDate();
    // currency = documentSnapshot["currency"];
  }

  WalletModel.fromQueryDocumentSnapshot({required QueryDocumentSnapshot queryDocSnapshot}) {
    var data = queryDocSnapshot.data();
    id = queryDocSnapshot.id;
    name = data["name"];
    datecreated = data["datecreated"].toDate();
    // currency = data["currency"];
  }
}
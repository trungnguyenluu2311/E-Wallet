// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BudgetModel {
  late String id;
  late String name;
  late String walletname;
  late String spending;
  late DateTime datespend;
  late String idcategory;

  BudgetModel({
    required this.id,
    required this.name,
    required this.walletname,
    required this.spending,
    required this.datespend,
    required this.idcategory,
  });

  BudgetModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    walletname = documentSnapshot["walletname"];
    spending = documentSnapshot["spending"];
    name = documentSnapshot["name"];
    datespend = documentSnapshot["datespend"].toDate();
    idcategory = documentSnapshot["idcategory"];
  }

  BudgetModel.fromQueryDocumentSnapshot({required QueryDocumentSnapshot queryDocSnapshot}) {
    var data = queryDocSnapshot.data();
    id = queryDocSnapshot.id;
    name = data["name"];
    walletname = data["walletname"];
    spending = data["spending"];
    name = data["name"];
    datespend = data["datespend"].toDate();
    idcategory = data["idcategory"];
  }
}
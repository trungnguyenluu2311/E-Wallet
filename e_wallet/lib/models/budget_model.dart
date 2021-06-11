import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BudgetModel {
  String id;
  String name;
  String walletname;
  String spending;
  DateTime datespend;
  String idcategory;

  BudgetModel({
    this.id,
    this.name,
    this.walletname,
    this.spending,
    this.datespend,
    this.idcategory,
  });

  BudgetModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    walletname = documentSnapshot["walletname"];
    spending = documentSnapshot["spending"];
    name = documentSnapshot["name"];
    datespend = documentSnapshot["datespend"].toDate();
    idcategory = documentSnapshot["idcategory"];
  }

  BudgetModel.fromQueryDocumentSnapshot({QueryDocumentSnapshot queryDocSnapshot}) {
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
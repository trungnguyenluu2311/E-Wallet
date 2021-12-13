import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlannedModel {
  late String id;
  late String name;
  late String walletname;
  late String spending;
  late DateTime datespend;
  late String note;
  late String classify;
  late String idcategory;
  late String confirmation;

  PlannedModel({
    required this.id,
    required this.name,
    required this.walletname,
    required this.spending,
    required this.datespend,
    required this.note,
    required this.classify,
    required this.idcategory,
    required this.confirmation
  });

  PlannedModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    walletname = documentSnapshot["walletname"];
    spending = documentSnapshot["spending"];
    name = documentSnapshot["name"];
    datespend = documentSnapshot["datespend"].toDate();
    note = documentSnapshot["note"];
    classify = documentSnapshot["classify"];
    idcategory = documentSnapshot["idcategory"];
    confirmation = documentSnapshot["confirmation"];
  }

  PlannedModel.fromQueryDocumentSnapshot({required QueryDocumentSnapshot queryDocSnapshot}) {
    var data = queryDocSnapshot.data();
    id = queryDocSnapshot.id;
    name = data["name"];
    walletname = data["walletname"];
    spending = data["spending"];
    name = data["name"];
    datespend = data["datespend"].toDate();
    note = data["note"];
    classify = data["classify"];
    idcategory = data["idcategory"];
    confirmation = data["confirmation"];
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlannedModel {
  String id;
  String name;
  String walletname;
  String spending;
  DateTime datespend;
  String note;
  String classify;
  String idcategory;
  String confirmation;

  PlannedModel({
    this.id,
    this.name,
    this.walletname,
    this.spending,
    this.datespend,
    this.note,
    this.classify,
    this.idcategory,
    this.confirmation
  });

  PlannedModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
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

  PlannedModel.fromQueryDocumentSnapshot({QueryDocumentSnapshot queryDocSnapshot}) {
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
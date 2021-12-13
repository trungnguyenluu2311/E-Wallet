import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SpendingModel {
  late String id;
  late String name;
  late String walletname;
  late String spending;
  late DateTime datespend;
  late String note;
  late String photo;
  late String classify;
  late String idcategory;

  SpendingModel({
    required this.id,
    required this.name,
    required this.walletname,
    required this.spending,
    required this.datespend,
    required this.note,
    required this.photo,
    required this.classify,
    required this.idcategory,
  });

  SpendingModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    walletname = documentSnapshot["walletname"];
    spending = documentSnapshot["spending"];
    name = documentSnapshot["name"];
    datespend = documentSnapshot["datespend"].toDate();
    note = documentSnapshot["note"];
    photo = documentSnapshot["photo"];
    classify = documentSnapshot["classify"];
    idcategory = documentSnapshot["idcategory"];
  }

  SpendingModel.fromQueryDocumentSnapshot({required QueryDocumentSnapshot queryDocSnapshot}) {
    var data = queryDocSnapshot.data();
    id = queryDocSnapshot.id;
    name = data["name"];
    walletname = data["walletname"];
    spending = data["spending"];
    name = data["name"];
    datespend = data["datespend"].toDate();
    note = data["note"];
    photo = data["photo"];
    classify = data["classify"];
    idcategory = data["idcategory"];
  }
}
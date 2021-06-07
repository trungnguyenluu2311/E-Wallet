import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SpendingModel {
  String id;
  String name;
  String walletname;
  String spending;
  DateTime datespend;
  String note;
  String photo;
  String classify;
  String idcategory;

  SpendingModel({
    this.id,
    this.name,
    this.walletname,
    this.spending,
    this.datespend,
    this.note,
    this.photo,
    this.classify,
    this.idcategory,
  });

  SpendingModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
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

  SpendingModel.fromQueryDocumentSnapshot({QueryDocumentSnapshot queryDocSnapshot}) {
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
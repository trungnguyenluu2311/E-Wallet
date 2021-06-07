import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String color;
  String note;

  CategoryModel({
    this.id,
    this.name,
    this.color,
    this.note,
  });

  CategoryModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    color = documentSnapshot["color"];
    note = documentSnapshot["note"];
  }

  CategoryModel.fromQueryDocumentSnapshot({QueryDocumentSnapshot queryDocSnapshot}) {
    var data = queryDocSnapshot.data();
    id = queryDocSnapshot.id;
    name = data["name"];
    color = data["color"];
    note = data["note"];
  }
}
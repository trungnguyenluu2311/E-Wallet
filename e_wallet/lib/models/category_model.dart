import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  late String id;
  late String name;
  late String color;
  late String note;

  CategoryModel({
    required this.id,
    required this.name,
    required this.color,
    required this.note,
  });

  CategoryModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    color = documentSnapshot["color"];
    note = documentSnapshot["note"];
  }

  CategoryModel.fromQueryDocumentSnapshot({required QueryDocumentSnapshot queryDocSnapshot}) {
    var data = queryDocSnapshot.data();
    id = queryDocSnapshot.id;
    name = data["name"];
    color = data["color"];
    note = data["note"];
  }
}
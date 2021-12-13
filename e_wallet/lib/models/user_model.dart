import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String id;
  late String name;
  late String email;
  late String idwallet;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.idwallet,
  });

  UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    email = documentSnapshot["email"];
    idwallet = documentSnapshot["idwallet"];
  }

  UserModel.fromQueryDocumentSnapshot({required QueryDocumentSnapshot queryDocSnapshot}) {
    var data = queryDocSnapshot.data();
    id = queryDocSnapshot.id;
    name = data["name"];
    email = data["email"] ;
    idwallet = data["idwallet"];
  }
}

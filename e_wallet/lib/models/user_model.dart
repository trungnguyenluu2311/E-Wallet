import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String email;
  String idwallet;

  UserModel({
    this.id,
    this.email,
    this.name,
    this.idwallet,
  });

  UserModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    email = documentSnapshot["email"];
    idwallet = documentSnapshot["idwallet"];
  }

  UserModel.fromQueryDocumentSnapshot({QueryDocumentSnapshot queryDocSnapshot}) {
    var data = queryDocSnapshot.data();
    id = queryDocSnapshot.id;
    name = data["name"];
    email = data["email"] ;
    idwallet = data["idwallet"];
  }
}

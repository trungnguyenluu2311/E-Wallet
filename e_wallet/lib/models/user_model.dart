import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  String id;
  String name;
  String email;

  UserModel({
    this.id,
    this.email,
    this.name,
  });


}

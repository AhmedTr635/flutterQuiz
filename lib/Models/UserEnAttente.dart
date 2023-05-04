import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserEnAttente {
  String? name;
  String? quizName;

  UserEnAttente({
    required this.name,
    this.quizName,
  });

  Map<String, dynamic> toMap(UserEnAttente myuser) {
    Map<String, dynamic> map = Map<String, dynamic>();

    map["name"] = myuser.name;
    map["quizName"] = myuser.quizName;

    return map;
  }

  UserEnAttente.fromMap(Map<String, dynamic> map) {
    this.name = map["name"];
    this.quizName = map["quizName"];
  }
}

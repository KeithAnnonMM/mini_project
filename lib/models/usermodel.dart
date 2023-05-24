import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  late String firstName;
  late String lastName;
  late String email;
  late String password;
  late String country;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.country,
    this.id,
  });

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc.id;
    firstName = doc['firstName'];
    lastName = doc['lastName'];
    email = doc['email'];
    password = doc['password'];
    country = doc['country'];
  }
}

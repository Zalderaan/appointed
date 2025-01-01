import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String id;
  final String name;
  final String email;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  // factory constructor to create a user object from a map / firestore document
  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      id: data['uid'],
      name:  data['name'],
      email: data['email'],
    );
  }

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
    );
  }

  // convert to map for uploading to firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}
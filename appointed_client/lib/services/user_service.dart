import 'package:appointed_client/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc().set(user.toMap());
    } catch (error) {
      throw Exception('Failed to create user: $error');
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      final docRef = _firestore.collection("users").doc(uid);
      final doc = await docRef.get();
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        return UserModel.fromMap(data);
      } else {
        throw Exception('User not found');
      }
    } catch (error) {
      throw Exception('Failed to get user: $error');
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).update(user.toMap());
    } catch (error) {
      throw Exception('Failed to update user: $error');
    }
  }

  Future<void> deleteUser(String uid) async {
    try {
      await _firestore.collection("users").doc(uid).delete();
    } catch (error) {
      throw Exception('Failed to delete user: $error');
    }
  }
}
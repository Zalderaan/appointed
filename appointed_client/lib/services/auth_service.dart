import 'package:firebase_auth/firebase_auth.dart';
import 'package:appointed_client/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // register with email & password
  Future<UserModel?> register(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      final user = userCredential.user;
      if (user != null) {
        return UserModel.fromFirebase(user); // convert firebase user to UserModel
      } else {
        throw Exception('User is null');
      }

    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (error.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (error) {
      throw Exception('Failed to register: $error');
    }
    throw Exception('Sign in failed due to an unknown error.');
  }

  // sign in with email & password
  Future<UserModel?> signIn(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      final user = userCredential.user;
      if (user != null) {
        return UserModel.fromFirebase(user); // convert firebase user to UserModel
      } else {
        throw Exception('User is null');
      }
      
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        throw Exception('The email address is not registered.');
      } else if (error.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    } catch (error) {
      throw Exception('Failed to sign in: $error');
    }
    return null;
  }

  // sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // get current user
  Future<UserModel?> getCurrentUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      return UserModel.fromFirebase(user);
    }
  }
}
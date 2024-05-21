import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasker/utils/helper/exception_handler_firebase_auth.dart';

import '../../../utils/storage/storage_utils.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      Storage.setUser({
        'uid': userCredential.user!.uid,
        'email': userCredential.user!.email,
        'username': userCredential.user!.displayName,
      });
      return userCredential.user;
    } catch (e) {
      throw FirebaseAuthExceptionHandler.handleError(e as Exception);
    }
  }

  Future<User?> registerWithEmailPassword(String username, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'email': email,
          'username': username,
          'createdAt': FieldValue.serverTimestamp(),
        });

        // Store user data locally
        Storage.setUser({
          'uid': user.uid,
          'email': email,
          'username': username,
        });
      }
      return user;
    }  catch (e) {
      throw FirebaseAuthExceptionHandler.handleError(e as Exception);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    Storage.clearUser();
  }

  User? get currentUser => _auth.currentUser;
}

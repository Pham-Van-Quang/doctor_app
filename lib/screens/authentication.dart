import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authenStateChanges => _firebaseAuth.authStateChanges();

  loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  updateUserPhoto(String photoUrl) async {
    print(photoUrl);
    await _firebaseAuth.currentUser?.updatePhotoURL(photoUrl);
  }

  signupWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  logout() async {
    await _firebaseAuth.signOut();
  }
}

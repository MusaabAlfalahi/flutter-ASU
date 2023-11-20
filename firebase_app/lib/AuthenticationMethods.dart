import 'package:firebase_auth/firebase_auth.dart';


class AuthenticationHelper {
  FirebaseAuth auth = FirebaseAuth.instance;
  get user => auth.currentUser;

  Future signup({required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signin({required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signout() async {
    await auth.signOut();
  }
}

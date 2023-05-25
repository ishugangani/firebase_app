import 'package:firebase_auth/firebase_auth.dart';

class FireBaseHelper {
  static FireBaseHelper fireHelper = FireBaseHelper._();

  FireBaseHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void signUp({required email, required password}) {
    firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => print("Success"))
        .catchError((e) => print("$e"));
  }

  void signIn({required email, required password}) {
    firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => print("Success"))
        .catchError((e) => print("Failed : $e"));
  }

  bool checkUser() {
    User? user = firebaseAuth.currentUser;
    return user != null;
  }
}

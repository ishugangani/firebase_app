import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<String?> googleSignIn() async {
    String? msg;
    GoogleSignInAccount? user = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? auth = await user!.authentication;
    var crd = GoogleAuthProvider.credential(
        accessToken: auth.accessToken, idToken: auth.idToken);
    await firebaseAuth
        .signInWithCredential(crd)
        .then((value) => msg = "Success")
        .catchError((e) => msg = "Failed : $e");

    return msg;
  }
}

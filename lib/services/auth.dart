import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sing in anon
  Future signInAnon() async {
    try {
      // _auth is the object we do use to interact use FirebaseAuth
      // in result ist das ergebins aus _authsign... also ob es geklappt hat.
      // wir brauchen AuthResult, weil aus _auth... eben ein objekt der Klasse AuthResult kommt
      AuthResult result = await _auth.signInAnonymously();
      // wir haben mit result einen user und den stecken wir jetzt in die var user
      FirebaseUser user = result.user;
      // wir returnen den tatsächlichen user, damit mit ihm später gearbeitet werden kann
      return user;
    } catch (e) {
      print(e.toString());
      //Wenn wir als anony einloggen und es fehlschlägt, erhalten wir als user NULL und können damit arbeiten
      return null;
    }
  }

  // sign in with email & password

  // register with email & password

  // sign out

}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_first_steps/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream (ob eingeloggt oder nicht usw.)
  // Wenn immer ein change beim user-status stattfindet, erhalten wir einen FirebaseUser
  // in den klammern steht btw das, wass wir zurück erhalten beim return. Merke, in den klammernn stand vorher FirebaseUser
  Stream<User> get user {
    return _auth.onAuthStateChanged
        // Wir wollen unseren eigenen User benutzen (uuid), deshalb ändern wir den FirebaseUser in einen user um.
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        // wir können das auch so machen, dass ist ein einfaches ConvertTo_userFromFirebaseUser(user)
        .map(_userFromFirebaseUser);
  }

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
      return _userFromFirebaseUser(user);
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

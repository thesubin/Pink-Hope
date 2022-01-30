import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/database/Database.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  Database db;
 
  AuthenticationService(this._firebaseAuth);

  /// Changed to idTokenChanges as it updates depending on more cases.
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  /// This won't pop routes so you could do something like
  /// Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  /// after you called this method if you want to pop all routes.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

   getUser()  {
   return  _firebaseAuth.currentUser.email.toString();
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      print("Signed");
      return "Signed in";
    } on FirebaseAuthException catch (e) {
       print("Isnt Signed in"+ e.message);
      return e.message;
    }
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<String> signUp({String email, String password,String name}) async {
         db = Database();
       db.initiliase();
     
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((value) => 
      
        db.createUser(value.user.email,name)
      
        );
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      switch(e.message.toUpperCase()){
        case "GIVEN STRING IS EMPTY OR NULL":
        return "Fields Cannot be empty";
        break;
        default:
         return e.message;
   
      }
    }
  }
}
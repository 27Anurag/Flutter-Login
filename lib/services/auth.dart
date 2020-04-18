import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/models/user.dart';

class AuthService {
// underscore auth means its private to this class
//_auth is an instance of FirebaseAuth of the type FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create user object based on firebase user 
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid : user.uid) : null ;
  }
  // auth change user stream 
  Stream<User> get user {
    return _auth.onAuthStateChanged 
    // .map((FirebaseUser user )=> _userFromFirebaseUser(user)) ;
    // is same as
    .map(_userFromFirebaseUser) ;

  }

  // sign in anonymously
  Future signInAnon() async {
    try {
      //'result' holds the result from .signInAnonymously(), of the type AuthResult
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user ;
      return _userFromFirebaseUser(user) ;
    } 
    catch (e) {
      
      print(e.toString()) ;
      return null ;
    }
  }


  //sign in with email ans pass


  //register with email pass


  // sign out
Future SignOut()async{
  try {
    return await _auth.signOut() ;

  }catch(e){
    print(e.toString()); 
    return null ;
  }

}



}
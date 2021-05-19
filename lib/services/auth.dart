import 'package:firebase_auth/firebase_auth.dart';

import '../models/userr.dart';



class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // user object
  
  Userr _userFromUser(User user){
    return user != null ? Userr(uid: user.uid): null;
  }

  // auth change user stream

   Stream<Userr> get user {
     return _auth.authStateChanges()
     //.map((User user) => _userFromUser(user));
       .map(_userFromUser);
   }


// //anonymous
// Future signInAnon() async {
//   try {
//       UserCredential result = await _auth.signInAnonymously();
//       User user = result.user;
//      return _userFromUser(user);
//   } catch(e) {
//     print(e.toString());
//     return null;
//   }
// }


//singin email and password
Future signInWithEmailAndPassword(String email, String password) async{
  try{
    UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    User user = result.user;
    return _userFromUser(user);
  } catch(e){
    print(e.toString());
    return null;
  }
}


//register email
Future registerWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user= result.user;

      //create new document for user with uid
      //await DatabaseService(uid: user.uid).updateUserData('abc', 'year', '48');
      return _userFromUser(user);

    }catch(e){

      print(e.toString());
      return null;
    }
}


//singout
Future signOut() async {
  try{
    return await _auth.signOut();

  } catch(e){
    print(e.toString());
  }
}


}
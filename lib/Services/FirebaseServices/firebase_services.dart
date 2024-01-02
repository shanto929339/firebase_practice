

import 'package:firebase_auth/firebase_auth.dart';

class FirebasServices{



FirebaseAuth auth = FirebaseAuth.instance;



    Future<User?> signUpWithEmailAndPassWord(String email,String password)async{

   try{
     UserCredential credential=await auth.createUserWithEmailAndPassword(email: email, password: password);

     return credential.user;


   }catch(e){

        print("Here some Error");
   }

    }

Future<User?> signInWithEmailAndPassWord(String email,String password)async{

  try{
    UserCredential credential=await auth.signInWithEmailAndPassword(email: email, password: password);

    return credential.user;

  }catch(e){

    print("Here some Error");
  }

}






}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/Services/FirebaseServices/firebase_services.dart';
import 'package:firebase_practice/View/Screnns/Auth/auth_sign_in.dart';
import 'package:firebase_practice/View/Screnns/UserDetailsScreen/user_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebasServices auth= FirebasServices();
  FirebaseAuth _auth=FirebaseAuth.instance;

  currentUSer(){
    var currentUser= _auth.currentUser;
    return currentUser?.email;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(currentUSer()),
            ],
          ),

          SizedBox(height: 16.0,),

          Container(
            alignment: Alignment.center,
            height: 50.0,
            width: 100.0,
             child: ElevatedButton(onPressed:(){
               signOut();
               Get.off(SignInPage());
             },
                 child:const Text("SignOut")),
          ),

          SizedBox(height: 16.0,),


          ElevatedButton(onPressed: (){

            Get.to(UserDetails());
          }, child:Text("Add Details"),),








        ],
      ),
    );
  }
  Future<void> signOut()async{
    return FirebasServices().auth.signOut();
  }
}

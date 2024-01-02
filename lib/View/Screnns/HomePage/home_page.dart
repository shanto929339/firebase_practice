import 'package:firebase_practice/Services/FirebaseServices/firebase_services.dart';
import 'package:firebase_practice/View/Screnns/Auth/auth_sign_in.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue,
         child: ElevatedButton(onPressed:(){
           signOut();
           Get.to(SignInPage());
         },
             child:const Text("submit")),
      ),
    );
  }
  Future<void> signOut()async{
    return FirebasServices().auth.signOut();
  }
}

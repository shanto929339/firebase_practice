
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/Services/FirebaseServices/firebase_services.dart';
import 'package:firebase_practice/View/Screnns/Auth/auth_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../HomePage/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

    final FirebasServices auth= FirebasServices();
  TextEditingController emailController=TextEditingController();
  TextEditingController passWordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          GestureDetector(
              onTap: (){
                Get.to(SignUpPage());
              },
              child: Text("SignInPage")),
              SizedBox(height: 50.0,),
          TextField(
            controller:emailController,
            decoration: const InputDecoration(
                hintText:"Email",
                border:OutlineInputBorder(
                  borderRadius:  BorderRadius.all(Radius.circular(30.0)),

                )
            ),
          ),
          const SizedBox(height: 10.0,),
          TextField(
            controller:passWordController,
            decoration: const InputDecoration(
                hintText:"Password",
                border:OutlineInputBorder(
                  borderRadius:  BorderRadius.all(Radius.circular(30.0)),

                )
            ),
          ),
          const SizedBox(height: 10.0,),

          ElevatedButton(onPressed:(){ signIn();}, child:const Text("SignIn")),
        ],

      ),

    );
  }

          signIn() async {
    String   email=emailController.text;
    String  password=passWordController.text;
    User? user= await auth.signInWithEmailAndPassWord(email, password);
    if(user!=null){
      print("Done");
      Get.to(HomePage());
    }
    else{
      print("try agin");
    }
  }
}

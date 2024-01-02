import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/Services/FirebaseServices/firebase_services.dart';
import 'package:firebase_practice/View/Screnns/HomePage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final FirebasServices auth= FirebasServices();

  TextEditingController emailController=TextEditingController();
  TextEditingController passWordController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body:  Padding(
          padding: const EdgeInsets.all(8.0),

          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("Sign Up Page "),


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
                  hintText:"PassWord",
                  border:OutlineInputBorder(
                    borderRadius:  BorderRadius.all(Radius.circular(30.0)),

                  )
              ),
            ),
            const SizedBox(height: 10.0,),

            ElevatedButton(onPressed:(){

              if(emailController!=null && passWordController !=null){
                signUp();
              }else{
                print("Please fill up all info ");
              }
            },
                child:const Text("SignUp")),
          ],

      ),
        ),
    );
  }

      void signUp() async {
    String   email=emailController.text;
    String  password=passWordController.text;
    User? user= await auth.signUpWithEmailAndPassWord(email, password);

    if(user!=null){
      print("Done");
      Get.to(HomePage());
    }
    else{
       print("try agin");
    }
  }



}


import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {


  TextEditingController emailController=TextEditingController();
  TextEditingController passWordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller:emailController,
            decoration: InputDecoration(
                hintText:"Email",
                border:OutlineInputBorder(
                  borderRadius:  BorderRadius.all(Radius.circular(30.0)),

                )
            ),
          ),
          SizedBox(height: 10.0,),
          TextField(
            controller:passWordController,
            decoration: InputDecoration(
                hintText:"Email",
                border:OutlineInputBorder(
                  borderRadius:  BorderRadius.all(Radius.circular(30.0)),

                )
            ),
          ),
          SizedBox(height: 10.0,),

          ElevatedButton(onPressed:(){print("Hi");}, child:Text("submit")),
        ],

      ),

    );
  }
}

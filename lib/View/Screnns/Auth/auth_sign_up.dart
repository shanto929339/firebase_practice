import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

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
                  hintText:"Email",
                  border:OutlineInputBorder(
                    borderRadius:  BorderRadius.all(Radius.circular(30.0)),

                  )
              ),
            ),
            const SizedBox(height: 10.0,),

            ElevatedButton(onPressed:(){

              // if(emailController!=null && passWordController !=null){
              //   signUp();
              // }else{
              //   print(" Fill up all info ");
              // }
            },
                child:const Text("submit")),
          ],

      ),
        ),
    );
  }



}

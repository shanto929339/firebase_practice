import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  FirebaseAuth auth= FirebaseAuth.instance;
  currentUser(){
    return auth.currentUser?.email;
  }
  TextEditingController nameController=TextEditingController();
  TextEditingController designationController=TextEditingController();
  TextEditingController locationController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const SizedBox(height: 10.0,),
          TextField(
            controller:nameController,
            decoration: const InputDecoration(
                hintText:"Name",
                border:OutlineInputBorder(
                  borderRadius:  BorderRadius.all(Radius.circular(30.0)),

                )
            ),
          ),
          const SizedBox(height: 10.0,),
          TextField(
            controller:designationController,
            decoration: const InputDecoration(
                hintText:"Designation",
                border:OutlineInputBorder(
                  borderRadius:  BorderRadius.all(Radius.circular(30.0)),

                )
            ),
          ),
          const SizedBox(height: 10.0,),

          TextField(
            controller:locationController,
            decoration: const InputDecoration(
                hintText:"Location",
                border:OutlineInputBorder(
                  borderRadius:  BorderRadius.all(Radius.circular(30.0)),
                )
            ),
          ),
          const SizedBox(height: 10.0,),



          ElevatedButton(onPressed:(){creatUserdetaila();},child:Text("Submit "),),


        ],
      ),

    );
  }


  creatUserdetaila()async{

     CollectionReference _collectionRef= FirebaseFirestore.instance.collection("user_details");

     return _collectionRef.doc(currentUser()).set({
       "Name":nameController.text.toString().trim(),
       "Designation":designationController.text.toString().trim(),
        "Location":locationController.text.toString().trim(),

     }).then((value) =>Get.snackbar("","added Successfully"),);


  }

}

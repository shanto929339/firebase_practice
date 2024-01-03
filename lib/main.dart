import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_practice/View/Screnns/Auth/auth_sign_in.dart';
import 'package:firebase_practice/View/Screnns/Auth/auth_sign_up.dart';
import 'package:firebase_practice/View/Screnns/HomePage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  FirebaseAuth auth= FirebaseAuth.instance;
  var isLogedIn=false;

  cheakLogedIn()async{
        auth. authStateChanges().listen((User?user) {

          if(user != null && mounted){
              print(user);
               setState(() {
                 isLogedIn=true;
               });
          }
        });
      }
  @override

  void initState() {
    cheakLogedIn();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:isLogedIn? HomePage():SignInPage(),
    );
  }
}

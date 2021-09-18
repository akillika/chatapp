import 'package:chatapp/chatPage.dart';
import 'package:chatapp/signinPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (FirebaseAuth.instance.currentUser != null) {


    runApp(MyApp());
  } else {
    var currentUser = FirebaseAuth.instance.currentUser;
    runApp(MyApp1(currentUser!.uid.toString()));
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: SignInPage(),
    );
  }
}

class MyApp1 extends StatelessWidget {
  MyApp1(this.uid);
  final String uid;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ChatPage(UID: uid,),
    );
  }
}
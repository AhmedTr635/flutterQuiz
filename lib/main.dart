import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quizzapp2/UserRegistration.dart';
import 'package:quizzapp2/WaitingScreen.dart';
import 'package:quizzapp2/arts.dart';
import 'package:quizzapp2/home.dart';
import 'package:quizzapp2/login_screen.dart';
//import 'science.dart';
import 'WelcomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chiheb Hannechi',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: ArtsPage());
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ucoeadmin/Screens/AdminPage.dart';
import 'package:ucoeadmin/Screens/Announcements.dart';
import 'package:ucoeadmin/Screens/HomePage.dart';
import 'package:ucoeadmin/Screens/Previous.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ucoe Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminPage(),
    );
  }
}

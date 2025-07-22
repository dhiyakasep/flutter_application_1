import 'package:dhiya12rpl1_app/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Applikasi Flutter ',
      theme: ThemeData( 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
      ),
      debugShowCheckedModeBanner: false,
      home: loginPage()
    );
  }
}

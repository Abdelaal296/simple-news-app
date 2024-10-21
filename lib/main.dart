import 'package:flutter/material.dart';
import 'package:news_app/home.dart';
import 'package:news_app/service.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      initialRoute: 'mainScreen',
      routes: {
        'mainScreen': (context) => HomeScreen(),
      },
    );
  }
}



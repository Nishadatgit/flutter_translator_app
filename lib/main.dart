import 'package:flutter/material.dart';

import 'screens/screen_home.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(221, 23, 22, 22),
        primarySwatch: Colors.grey,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home:  MyHome(),
    );
  }
}

const api = "https://google-translate1.p.rapidapi.com/language/translate/v2";

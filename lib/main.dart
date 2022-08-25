import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:get/get.dart';

import 'screens/screen_home.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const[
        LocaleNamesLocalizationsDelegate()
      ],
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(221, 23, 22, 22),
        primarySwatch: Colors.grey,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: MyHome(),
    );
  }
}

const api = "https://google-translate1.p.rapidapi.com/language/translate/v2";

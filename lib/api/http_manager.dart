import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:translator_app/models/all_languges_model.dart';

class HttpServ {
  //Get all languages
  void getLanguages() async {
    const headers = {
      'Accept-Encoding': "application/gzip",
      'X-RapidAPI-Key': "80e71024d9msh99c2da5ca8d67f2p150ccejsn016042a1682b",
      'X-RapidAPI-Host': "google-translate1.p.rapidapi.com"
    };
    final url = Uri.parse(
        "https://google-translate1.p.rapidapi.com/language/translate/v2/languages");
    final response = await http.get(url, headers: headers);
    print(response.body);
    final jsonResponse = allLanguagesFromJson(response.body);
  }

  //Translate text from lang
  void translateFromLanguage(String text, String from, String to) async {
    const myheaders = {
      'X-RapidAPI-Key': '216987e692mshb1dc5227b1c5d59p178e80jsn6630e561787c',
      'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'
    };
    final payload = "q=Helloworld!&target=$from&source=$to";
    final url = Uri.parse(
        "https://google-translate1.p.rapidapi.com/language/translate/v2/translate");
    final transResponse =
        await http.post(url, headers: myheaders, body: payload);
    print(transResponse.body);
  }
}

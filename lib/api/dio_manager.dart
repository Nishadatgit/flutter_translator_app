import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:translator_app/models/all_languges_model.dart';

// class HttpDioService {
//   Dio dio = Dio(BaseOptions(
//       baseUrl: "https://google-translate1.p.rapidapi.com/language/translate/v2",
//       connectTimeout: 5000,
//       responseType: ResponseType.plain));

//   void getLanguages() async {
//     final response = await dio.post('/lanuguages');
//     print(response.data);
//   }
// }

class HttpServ {
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
}

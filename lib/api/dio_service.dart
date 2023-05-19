// import 'package:http/http.dart' as http;
// import 'package:translator_app/constants/url.dart';

// Future<dynamic> getAllLanguages() async {
//   final url = Uri.parse(baseUrl + '/languages');
// final response = await http.get(url, headers: {
//   'Accept-Encoding': 'application/gzip',
//   'X-RapidAPI-Key': '80e71024d9msh99c2da5ca8d67f2p150ccejsn016042a1682b',
//   'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'
// });

//   print(response.body);
//   return response;
// }
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:translator_app/models/all_languges_model.dart';
import 'package:http/http.dart' as http;
import 'package:translator_app/models/translation_response.dart';

class DioService {
  Future<AllLanguagesModel?> getMthod(String url) async {
    final headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'Accept-Encoding': 'application/gzip',
      'X-RapidAPI-Key': '216987e692mshb1dc5227b1c5d59p178e80jsn6630e561787c',
      'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'
    };
    Dio dio = Dio();
    return await dio
        .get(
      url,
      options: Options(
        responseType: ResponseType.plain,
        method: 'GET',
        headers: headers,
      ),
    )
        .then((response) {
      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.data);
        final result = AllLanguagesModel.fromJson(jsonBody);

        return result;
      } else if (response.statusCode == 404) {
        print('Error');
        return null;
      } else {
        return null;
      }
    });
  }

  Future<TranslationResponse?> translateText(String text, String from, String to) async {
    final headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'Accept-Encoding': 'application/gzip',
      'X-RapidAPI-Key': '216987e692mshb1dc5227b1c5d59p178e80jsn6630e561787c',
      'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'
    };
    const url = "https://google-translate1.p.rapidapi.com/language/translate/v2";
    final payload = "q=$text&target=$to&source=$from";
    Dio dio = Dio();
    try {
      final response = await dio.post(url,
          options: Options(
            method: 'POST',
            headers: headers,
            responseType: ResponseType.json,
          ),
          data: payload);
          log(response.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return TranslationResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on DioError catch (e) {
      log(e.toString());
      return null;
    }
  }
}

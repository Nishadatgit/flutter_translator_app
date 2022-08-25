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

import 'package:dio/dio.dart';
import 'package:translator_app/models/all_languges_model.dart';

class DioService {
  Future<AllLanguagesModel?> getMthod(String url) async {
    Dio dio = Dio();
    return await dio
        .get(url,
            options: Options(
                responseType: ResponseType.plain,
                method: 'GET',
                headers: {
                  'Accept-Encoding': 'application/gzip',
                  'X-RapidAPI-Key':
                      '80e71024d9msh99c2da5ca8d67f2p150ccejsn016042a1682b',
                  'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'
                }))
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
}

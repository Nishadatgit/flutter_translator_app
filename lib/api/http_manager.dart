import 'dart:convert';
import 'package:dio/dio.dart';

class DioAPiService {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();
    return await dio
        .get(
      url,
      options:
          Options(responseType: ResponseType.plain, method: 'GET', headers: {
        'Accept-Encoding': 'application/gzip',
        'X-RapidAPI-Key': '80e71024d9msh99c2da5ca8d67f2p150ccejsn016042a1682b',
        'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'
      }),
    )
        .then((response) {
      if (response.data == null) {
        return print('Error');
      }
      return jsonDecode(response.data!);
    });
  }
}

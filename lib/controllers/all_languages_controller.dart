import 'dart:developer';

import 'package:get/get.dart';
import 'package:translator_app/api/http_manager.dart';
import 'package:translator_app/models/all_languges_model.dart';

class AllLanguagesController extends GetxController {
  RxList<Language> allLanguages = RxList();

  getAllLanguages() async {
    final response = await DioAPiService().getMethod(
        'https://google-translate1.p.rapidapi.com/language/translate/v2/languages');

    response['languages'].forEach((element) {
      allLanguages.add(Language.fromJson(element));
    });
  }

  @override
  void onInit() {
    getAllLanguages();
    super.onInit();
  }
}

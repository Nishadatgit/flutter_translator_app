import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator_app/api/dio_service.dart';
import 'package:translator_app/constants/url.dart';
import 'package:translator_app/models/all_languges_model.dart';
import 'package:translator_app/models/language_model.dart';
import 'package:translator_app/models/translation_response.dart';

class AllLanguagesController extends GetxController {
  RxInt count = RxInt(0);
  var allLanguages = AllLanguagesModel();
  final TextEditingController toController = TextEditingController();
  final TextEditingController fromController = TextEditingController();
  var isLoading = true.obs;
  final fromLanguageNotifier = ValueNotifier<CustomLanguage?>(null);
  final toLanguageNotifier = ValueNotifier<CustomLanguage?>(null);

  getAllLanguages() async {
    final languages = await DioService().getMthod('$baseUrl/languages');

    allLanguages = languages!;
    isLoading = false.obs;
    count.value = allLanguages.data!.languages.length;
  }

  Future<void> translateText(String text) async {
    final TranslationResponse? response = await DioService()
        .translateText(text, fromLanguageNotifier.value!.shortName, toLanguageNotifier.value!.shortName);
    if (response != null) {
      if (response.translatedText.isNotEmpty) {
        toController.text = response.translatedText;
      } else {
        toController.clear();
      }
    }
  }

  @override
  void onInit() {
    getAllLanguages();
    super.onInit();
  }
}

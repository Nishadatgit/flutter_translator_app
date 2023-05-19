import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator_app/api/dio_service.dart';
import 'package:translator_app/controllers/all_languages_controller.dart';

import '../../constants/heights.dart';
import '../screen_home.dart';

class TranslateFromSection extends StatelessWidget {
  TranslateFromSection({
    Key? key,
  }) : super(key: key);
  final languageController = Get.find<AllLanguagesController>();
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            direction: Axis.horizontal,
            spacing: 4,
            children: [
              Text(
                'Translate From',
                style: TextStyle(color: Colors.grey.withOpacity(0.5)),
              ),
              ValueListenableBuilder(
                valueListenable: languageController.fromLanguageNotifier,
                builder: (context, value, child) {
                  return Text(value != null ? '(${value.fullname})' : '');
                },
              )
            ],
          ),
          kHeight20,
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
              child: TextField(
                style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                controller: fromController,
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                onChanged: (value) {
                  if (_debounce?.isActive ?? false) _debounce?.cancel();
                  _debounce = Timer(const Duration(milliseconds: 500), () {
                    translate(fromController.text);
                  });
                },
                maxLines: 10,
                maxLength: 1200,
              ),
            ),
          )
        ],
      ),
    );
  }

  void translate(String text) {
    if (languageController.fromLanguageNotifier.value == null || languageController.toLanguageNotifier.value == null) {
      return;
    }
    languageController.translateText(text);
  }
}

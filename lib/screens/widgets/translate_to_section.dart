import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator_app/controllers/all_languages_controller.dart';
import 'package:translator_app/screens/screen_home.dart';

import '../../constants/heights.dart';

class TranslateToSection extends StatelessWidget {
  TranslateToSection({
    Key? key,
  }) : super(key: key);
  final languageController = Get.find<AllLanguagesController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
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
                'Translate To',
                style: TextStyle(color: Colors.grey.withOpacity(0.5)),
              ),
              ValueListenableBuilder(
                valueListenable: languageController.toLanguageNotifier,
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
                readOnly: true,
                style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                controller: languageController. toController,
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                maxLines: 10,
                maxLength: 1200,
              ),
            ),
          )
        ],
      ),
    );
  }
}

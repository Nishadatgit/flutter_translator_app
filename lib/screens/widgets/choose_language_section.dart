import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator_app/api/dio_service.dart';
import 'package:translator_app/constants/url.dart';
import 'package:translator_app/controllers/all_languages_controller.dart';

import 'package:translator_app/screens/screen_home.dart';

import 'country_choose_button.dart';

class ChooseLanguageSection extends StatelessWidget {
  ChooseLanguageSection({
    Key? key,
  }) : super(key: key);
  final controller = Get.find<AllLanguagesController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: controller.fromLanguageNotifier,
            builder: (context, value, child) {
              return LanguageChooseButton(
                title:  value!=null?value.fullname:"Choose language",
                onPressed: () {
                  DioService().getMthod('$baseUrl/languages');
                  showLanguageBottomSheet(Type.translateFrom, context);
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Icon(
            Icons.sync_alt,
            color: Colors.grey.withOpacity(0.8),
          ),
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: controller.toLanguageNotifier,
            builder: (context, value, child) {
              return LanguageChooseButton(
                title: value!=null?value.fullname:"Choose language",
                onPressed: () {
                  showLanguageBottomSheet(Type.translateTo, context);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

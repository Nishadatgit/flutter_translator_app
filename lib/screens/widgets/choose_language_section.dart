import 'package:flutter/material.dart';
import 'package:translator_app/api/http_manager.dart';
import 'package:translator_app/screens/screen_home.dart';

import 'country_choose_button.dart';

class ChooseLanguageSection extends StatelessWidget {
  const ChooseLanguageSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: fromLanguageNotifier,
            builder: (context, value, child) {
              return LanguageChooseButton(
                title: value,
                onPressed: () {
                  HttpServ().translateFromLanguage('hello', 'en', 'es');
                  showLanguageBottomSheet(type.translateFrom, context);
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
            valueListenable: toLanguageNotifier,
            builder: (context, value, child) {
              return LanguageChooseButton(
                title: value,
                onPressed: () {
                  showLanguageBottomSheet(type.translateTo, context);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

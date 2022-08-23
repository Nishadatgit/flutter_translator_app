import 'package:flutter/material.dart';
import 'package:translator_app/constants/heights.dart';

import 'widgets/choose_language_section.dart';

class MyHome extends StatelessWidget {
   MyHome({super.key});
  final TextEditingController fromController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Text Translation',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.white),
              ),
              kHeight10,
              Divider(color: Colors.grey),
              kHeight10,
              ChooseLanguageSection(),
              kHeight20,
              TranslateToSection(),
              kHeight20,
              Container(
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
                        const Text('(India)'),
                      ],
                    ),
                    kHeight20,
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter text to translate',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TranslateToSection extends StatelessWidget {
  const TranslateToSection({
    Key? key,
  }) : super(key: key);

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
              const Text('(Germany)'),
            ],
          ),
          kHeight20,
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Enter text to translate',
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

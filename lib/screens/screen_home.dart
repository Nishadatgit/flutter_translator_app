import 'package:flutter/material.dart';
import 'package:translator_app/api/my_data.dart';
import 'package:translator_app/constants/heights.dart';

import 'widgets/choose_language_section.dart';
import 'widgets/translate_from_section.dart';
import 'widgets/translate_to_section.dart';

final TextEditingController fromController = TextEditingController();
final TextEditingController toController = TextEditingController();
final fromLanguageNotifier = ValueNotifier('English');
final toLanguageNotifier = ValueNotifier('Malayalam');

enum type { translateFrom, translateTo }

class MyHome extends StatelessWidget {
  MyHome({super.key});

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
              Divider(color: Colors.grey.withOpacity(0.4)),
              kHeight10,
              const ChooseLanguageSection(),
              kHeight20,
              const TranslateFromSection(),
              kHeight20,
              const TranslateToSection()
            ],
          ),
        ),
      ),
    );
  }
}

void showLanguageBottomSheet(type operatiotype, BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(20),
        height: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              operatiotype == type.translateFrom ? 'From' : 'To',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            kHeight20,
            TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.3))),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 25,
                  ),
                  hintText: 'Search for language',
                  hintStyle: const TextStyle(color: Colors.white24)),
            ),
            kHeight20,
            const Text('All Languages'),
            kHeight10,
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: InkWell(
                      onTap: () {
                        if (operatiotype == type.translateFrom) {
                          fromLanguageNotifier.value = languages[index];
                          Navigator.of(context).pop();
                        } else {
                          toLanguageNotifier.value = languages[index];
                          Navigator.of(context).pop();
                        }
                      },
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: Colors.black26,
                        title: Text(
                          languages[index],
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.accents[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    backgroundColor: Colors.grey[900],
  );
}

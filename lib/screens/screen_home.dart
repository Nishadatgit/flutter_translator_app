import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:get/get.dart';
import 'package:translator_app/constants/heights.dart';
import 'package:translator_app/controllers/all_languages_controller.dart';
import 'widgets/choose_language_section.dart';
import 'widgets/translate_from_section.dart';
import 'widgets/translate_to_section.dart';

final TextEditingController fromController = TextEditingController();
final TextEditingController toController = TextEditingController();
final fromLanguageNotifier = ValueNotifier('Select a language');
final toLanguageNotifier = ValueNotifier('Select a language');

enum Type { translateFrom, translateTo }

class MyHome extends StatelessWidget {
  MyHome({super.key});
  final AllLanguagesController allLanguagesController =
      Get.put(AllLanguagesController());

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
                'Hello',
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

void showLanguageBottomSheet(Type operatiotype, BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      final languageController = Get.find<AllLanguagesController>();
      return Container(
        padding: const EdgeInsets.all(20),
        height: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              operatiotype == Type.translateFrom ? 'From' : 'To',
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
              itemCount: languageController.count.value,
              itemBuilder: (context, index) {
                if (getLocalName(
                        context,
                        languageController
                            .allLanguages.data!.languages[index].language) ==
                    null) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InkWell(
                    onTap: () {
                      if (operatiotype == Type.translateFrom) {
                        Navigator.of(context).pop();
                        fromLanguageNotifier.value = getLocalName(
                            context,
                            languageController
                                .allLanguages.data!.languages[index].language)!;
                      } else {
                        toLanguageNotifier.value = getLocalName(
                            context,
                            languageController
                                .allLanguages.data!.languages[index].language)!;
                        Navigator.of(context).pop();
                      }
                    },
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: Colors.black26,
                      title: Text(
                        getLocalName(
                            context,
                            languageController
                                .allLanguages.data!.languages[index].language)!,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.accents[index % 3],
                      ),
                    ),
                  ),
                );
              },
            )),
          ],
        ),
      );
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    backgroundColor: Colors.grey[900],
  );
}

String? getLocalName(BuildContext context, String locale) {
  return LocaleNames.of(context)!.nameOf(locale);
}

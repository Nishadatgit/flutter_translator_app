import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:get/get.dart';
import 'package:translator_app/constants/heights.dart';
import 'package:translator_app/controllers/all_languages_controller.dart';
import 'package:translator_app/models/language_model.dart';
import 'widgets/choose_language_section.dart';
import 'widgets/translate_from_section.dart';
import 'widgets/translate_to_section.dart';

enum Type { translateFrom, translateTo }

class MyHome extends StatelessWidget {
  MyHome({super.key});
  final AllLanguagesController allLanguagesController = Get.put(AllLanguagesController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Text Translation',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            kHeight10,
            ChooseLanguageSection(),
            kHeight20,
            TranslateFromSection(),
            kHeight20,
            TranslateToSection()
          ],
        ),
      ),
    );
  }
}

void showLanguageBottomSheet(Type operatiotype, BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    elevation: 5,
    constraints: BoxConstraints.tight(Size.fromHeight(700)),
    barrierColor: Colors.transparent.withOpacity(.5),
    useSafeArea: true,
    context: context,
    builder: (context) {
      final languageController = Get.find<AllLanguagesController>();
      return Padding(
        padding: const EdgeInsets.all(20),
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
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
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
                if (getLocalName(context, languageController.allLanguages.data!.languages[index].language) == null) {
                  return const SizedBox.shrink();
                }
                final item = CustomLanguage(
                    fullname: getLocalName(context, languageController.allLanguages.data!.languages[index].language)!,
                    shortName: languageController.allLanguages.data!.languages[index].language);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InkWell(
                    onTap: () {
                      if (operatiotype == Type.translateFrom) {
                        Navigator.of(context).pop();
                        languageController.fromLanguageNotifier.value = item;
                      } else {
                        languageController.toLanguageNotifier.value = item;
                        if (languageController.fromController.text.isNotEmpty) {
                          if (languageController.fromLanguageNotifier.value != null) {
                            languageController.translateText(languageController.fromController.text);
                          }
                        }
                        Navigator.of(context).pop();
                      }
                    },
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      title: Text(
                        item.fullname,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.accents[index % 3],
                        child: Text(
                          item.shortName.toUpperCase(),
                          style: const TextStyle(color: Colors.white),
                        ),
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

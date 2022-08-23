// To parse this JSON data, do
//
//     final allLanguages = allLanguagesFromJson(jsonString);

import 'dart:convert';

AllLanguages allLanguagesFromJson(String str) => AllLanguages.fromJson(json.decode(str));

String allLanguagesToJson(AllLanguages data) => json.encode(data.toJson());

class AllLanguages {
    AllLanguages({
        this.data,
    });

    Data? data;

    factory AllLanguages.fromJson(Map<String, dynamic> json) => AllLanguages(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.languages,
    });

    List<Language>? languages;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "languages": List<dynamic>.from(languages!.map((x) => x.toJson())),
    };
}

class Language {
    Language({
        this.language,
    });

    String? language;

    factory Language.fromJson(Map<String, dynamic> json) => Language(
        language: json["language"],
    );

    Map<String, dynamic> toJson() => {
        "language": language,
    };
}

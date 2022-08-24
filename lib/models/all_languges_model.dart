// To parse this JSON data, do
//
//     final allLanguagesModel = allLanguagesModelFromJson(jsonString);

import 'dart:convert';

AllLanguagesModel allLanguagesModelFromJson(String str) =>
    AllLanguagesModel.fromJson(json.decode(str));

String allLanguagesModelToJson(AllLanguagesModel data) =>
    json.encode(data.toJson());

class AllLanguagesModel {
  AllLanguagesModel({
    required this.data,
  });

  Data data;

  factory AllLanguagesModel.fromJson(Map<String, dynamic> json) =>
      AllLanguagesModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.languages,
  });

  List<Language> languages;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
      };
}

class Language {
  Language({
    required this.language,
  });

  String language;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "language": language,
      };
}

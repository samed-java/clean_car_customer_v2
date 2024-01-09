class LanguagesResModel {
  List<Language> languages;

  LanguagesResModel({
    required this.languages,
  });

  factory LanguagesResModel.fromJson(Map<String, dynamic> json) => LanguagesResModel(
    languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
  };
}

class Language {
  String code;
  String title;
  String icon;

  Language({
    required this.code,
    required this.title,
    required this.icon,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    code: json["code"],
    title: json["title"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "title": title,
    "icon": icon,
  };
}

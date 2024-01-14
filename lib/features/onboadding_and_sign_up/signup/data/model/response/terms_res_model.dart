class TermsResModel {
  List<Term> terms;

  TermsResModel({
    required this.terms,
  });

  factory TermsResModel.fromJson(Map<String, dynamic> json) => TermsResModel(
        terms: List<Term>.from(json["terms"].map((x) => Term.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "terms": List<dynamic>.from(terms.map((x) => x.toJson())),
      };
}

class Term {
  String title;
  String content;

  Term({
    required this.title,
    required this.content,
  });

  factory Term.fromJson(Map<String, dynamic> json) => Term(
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
      };
}

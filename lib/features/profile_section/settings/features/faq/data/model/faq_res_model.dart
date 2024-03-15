class FaqResModel {
  List<Faq> faqs;

  FaqResModel({
    required this.faqs,
  });

  factory FaqResModel.fromJson(Map<String, dynamic> json) => FaqResModel(
        faqs: List<Faq>.from(json["faqs"].map((x) => Faq.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "faqs": List<dynamic>.from(faqs.map((x) => x.toJson())),
      };
}

class Faq {
  String title;
  String content;

  Faq({
    required this.title,
    required this.content,
  });

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
      };
}

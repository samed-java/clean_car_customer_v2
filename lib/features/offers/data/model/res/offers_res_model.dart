class OfferResModel {
  List<Offer> offers;

  OfferResModel({
    required this.offers,
  });

  factory OfferResModel.fromJson(Map<String, dynamic> json) => OfferResModel(
    offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
  };
}

class Offer {
  String? title;
  String content;

  Offer({
    required this.title,
    required this.content,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    title: json["title"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "content": content,
  };
}

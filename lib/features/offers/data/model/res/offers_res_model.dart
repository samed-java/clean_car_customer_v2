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
  String? image;
  String? title;
  String content;
  String? discount;

  Offer({
    required this.image,
    required this.title,
    required this.content,
    required this.discount,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    image: json["image"],
    title: json["title"],
    content: json["content"],
    discount: json["discount"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "title": title,
    "content": content,
    "discount": discount,
  };
}
